module V1
  class EventsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index
    before_action :find_event, only: :like

    def create
    	@ev = Event.create(
    										user_id: current_user.id,
    										title: params[:title],
    										host: params[:host],
                        location: params[:where],
    										time: params[:time],
                        tags: params[:tags],
    										availability: params[:availability],
    										)
    	group = Group.create(event_id: @ev.id)
    	if @ev.save!
    		current_user.coins += 40
    		current_user.save
        evs = Event.where("time >= ?", Time.now)
        render json: evs.order(:time)
    	end
    end

    def update
    	@ev = Event.find_by_id(params[:eventId])
    	group = @ev.group if @ev
      if @ev.availability > 0 && current_user
    		group.members << current_user.email if !group.members.include?(current_user.email)
    		group.save
    		@ev.availability -= 1 unless group.members.include?(current_user.email)
    		@ev.save
    		current_user.coins += 20 unless group.members.include?(current_user.email)
        current_user.save
    		UserJoinMailer.joined(current_user.email, @ev.user.email).deliver
        UserJoinMailer.joined_reminder(current_user.email, @ev).deliver
        EventEmailJob.set(wait_until: @ev.time.to_time.yesterday).perform_later(current_user.email, @ev) unless Time.now > @ev.time.to_time.yesterday
    		render json: Event.where("time >= ?", Time.now).order(:time)
    	else
      	render json: {error: t('events_controller.too_many_joins')}, status: :unprocessable_entity
    	end 
    end

    def destroy
    	@ev = Event.find_by_id(params[:eventId])
    	if @ev.user_id = params[:userId] || User.find_by_id(params[:userId]).email == "yd2473@columbia.edu" || User.find_by_id(params[:userId]).email == "isaiah_thompkins@alumni.brown.edu"
    		@ev.destroy
    	end
    	render json: Event.all.order("time DESC")
    end

    def index
      evs = Event.where("time >= ?", Time.now)
      events = []
      if params[:tags].length > 0
        params[:tags].each do |t|
          evs.each do |ev|
            if ev.tags.include?(t) && !events.include?(ev)
              events << ev
            end
          end
        end
        render json: events.sort_by(&:time)
      else
        events = Event.where("time >= ?", Time.now)
        render json: events.order(:time)
      end
    end

    def getGroup
      ev = Event.find(params[:event_id])
      members = []
      ev.group.members.each do |m|
        members << User.find_by(email: m)
      end
      render json: members
    end

    def userLikes?
      if already_liked?
        render json: Event.find(params[:event_id]).likes
      end
    end

    def like
      unless already_liked?
        @event.likes.create(user_id: current_user.id)
        if @event.save
          render json: @event.likes
        end
      else
        render json: {error: t('events_controller.already_liked')}, status: :unprocessable_entity
      end 
    end

    def unlike
      if already_liked?
        l = Like.where(event_id: params[:event_id], user_id: current_user.id).first
        l.destroy unless Like.where(event_id: params[:event_id], user_id: current_user.id).first.nil?
        render json: Event.find(params[:event_id]).likes
      else
        render json: {error: t('events_controller.couldnt_unlike')}, status: :unprocessable_entity
      end
    end


    private

    def find_event
       @event = Event.find(params[:event_id])
    end

    def already_liked?
      !Like.where(user_id: current_user.id, event_id:
      params[:event_id]).first.nil?
    end


  end
end
module V1
  class EventsController < ApplicationController
    skip_before_action :authenticate_user_from_token!


    def create
    	u = User.where(id: params[:userId]).first
    	if u && u.access_token == params[:authToken] && u.admin
	    	@ev = Event.create(
	    										user_id: u.id,
	    										title: params[:title],
	    										host: params[:host],
	    										time: params[:time],
	    										availability: params[:availability],
	    										category: params[:category]
	    										)
	    	group = Group.create(event_id: @ev.id)
	    	if group.save 
	    		group.members << u.email
	    	end
	    	if @ev.save
	    		render json: @ev
	    	end
	    end
    end

    def update
    	@ev = Event.find_by_id(params[:eventId])
    	group = @ev.group
    	group.members << User.find_by_id(params[:userId]).email 
    	group.save
    	render json: Event.all
    end

    def destroy
    	@ev = Event.find_by_id(params[:eventId])
    	if @ev.user_id = params[:userId] || User.find_by_id(params[:userId]).admin
    		@ev.destroy
    	end
    	render json: Event.all
    end



    def index
    	render json: Event.all
    end

  end
end
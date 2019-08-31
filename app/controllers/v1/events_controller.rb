module V1
  class EventsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
  	

    def create
    	@ev = Event.create(
    										user_id: params[:userId],
    										title: params[:title],
    										host: params[:host],
    										time: params[:time],
    										availability: params[:availability],
    										category: params[:category]
    										)
    	if @ev.save
    		render json: @ev
    	end
    end

    def update

    end

    def destroy
    	@ev = Event.where(params[:eventId]).first
    	if @ev.user_id = params[:userId]
    		@ev.destroy
    	end
    end

    def index
    	render json: Event.all
    end

  end
end
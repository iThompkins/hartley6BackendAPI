module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def create
      u = User.create(email: params[:email], password: params[:password], phone: params[:phone])
      if u.save
        sign_in u
        render json: u     
      end
    end
  end
end
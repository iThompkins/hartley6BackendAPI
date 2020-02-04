module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def update
      user = User.find_by_email(params[:email])
      if user.valid_password?(params[:password])
        puts 'changes began'
        user.update_attributes(password: params[:confirmPassword], phone: params[:phone])
      end
      if user.save
        puts json: user
        sign_in user
        render json: user  
      else
        render json: {"message": "Didn't work"} 
      end        
    end

    def create
      u = User.create(email: params[:email], password: params[:password], phone: params[:phone])
      if u.save
        sign_in u
        render json: u     
      end
    end
  end
end
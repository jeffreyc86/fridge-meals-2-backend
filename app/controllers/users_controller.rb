class UsersController < ApplicationController

  def show
        session[:user_id] = @current_user.id
        render json: @current_user
  end


end

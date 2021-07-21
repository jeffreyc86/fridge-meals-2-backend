class UsersController < ApplicationController

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        token = JWT.encode({ user_id: @user.id }, ENV['JWT_SECRET_KEY'], "HS256")
        session[:user_id] = @user.id
        render json: { user: UserSerializer.new(@user), token: token}
    else
        render json: { errors: ["Invalid Username or Password"] }, status: :unauthorized
    end 
  end
  
  def show
    session[:user_id] = @current_user.id
    render json: @current_user
  end


end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
       # implement with test later
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end



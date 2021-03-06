class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Links!"
      session[:user_id] = @user.id

      redirect_to links_path
    else
      flash[:failure] = "There was a problem creating your account."

      render :new
    end
  end

  private



  def user_params
    params.require(:user).permit(:email, :password)
  end
end

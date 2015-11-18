class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Links!"
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      flash[:failure] = "There was a problem creating your account."

      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
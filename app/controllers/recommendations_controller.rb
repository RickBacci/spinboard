class RecommendationsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @link = Link.find(params[:link_id])
  end

  def create
    RecommendationsMailer.notify_user(email_params, params).deliver_now

    redirect_to :back, notice: "Your email was sent."

  end

  private

  def email_params
    params.permit(:name, :email, :message)
  end
end

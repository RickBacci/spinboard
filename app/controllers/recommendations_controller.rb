class RecommendationsController < ApplicationController
  def new

  end

  def create
    RecommendationsMailer.notify_user(email_params).deliver_now

    redirect_to :back, notice: "Your email was sent."

  end

  private

  def email_params
    params.permit(:name, :email, :message)
  end
end

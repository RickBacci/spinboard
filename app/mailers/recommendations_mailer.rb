class RecommendationsMailer < ApplicationMailer

  def notify_user(user, params)
    @user = User.find(params[:user])
    @link = Link.find(params[:link])
    mail(
      to: user[:email],
      subject: "Check out my link recommendation #{@link.url}",
      message: "I recommend this link #{@link.url}"
      )

  end
end

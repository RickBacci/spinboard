class RecommendationsMailer < ApplicationMailer

  def notify_user(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "I am recommending the following link "

    @message = email_params[:message]

    mail(
      to: email_params[:email],
      subject: "I recommend this link #{email_params[:link]}",
      )

  end
end

class RecommendationsMailer < ApplicationMailer

  def notify_user(user)
    @user = user
    mail(
      to: user[:email],
      subject: "Check out my recommendation",
      message: "I recommend this link #{user[:link]}"
      )

  end
end

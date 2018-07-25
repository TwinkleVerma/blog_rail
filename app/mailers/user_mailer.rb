class UserMailer < ApplicationMailer

  def comment_notification_email(data)
    @article = data.article
    @comment = data
    @user = data.user
    mail(to: @article.user.email, subject: "#{ @user.username } has commented on your article")
  end

end
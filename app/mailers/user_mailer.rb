class UserMailer < ActionMailer::Base
  default from: "tom_doido@hotmail.com"

  def delete_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Sorry, we deleted your account')
  end
end

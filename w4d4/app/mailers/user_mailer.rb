class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://99cats.com/login'
    mail(to: user.username, subject: 'Welcome to 99cats!')
  end
end

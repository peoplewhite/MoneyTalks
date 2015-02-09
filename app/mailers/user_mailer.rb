class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_changed.subject
  #

  default from: "shonshon7@gmail.com"


  def password_changed id
  	@user  = User.find(id)
    mail to: @user.email, subject: "Your password has changed"
  end
end

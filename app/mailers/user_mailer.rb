class UserMailer < ApplicationMailer
  default from: 'root@localhost'
  def welcome_email(user)
    @user = user
    @site_name = Rails.configuration.x.clarity.site_name
    subject = @site_name + " - activation link"
    mail(to: @user.email, subject: subject)
  end
end
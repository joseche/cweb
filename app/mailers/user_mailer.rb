class UserMailer < ApplicationMailer
  default from: 'root@localhost'

  def activation_email(user)
    @user = user
    @site_name = Rails.configuration.x.site_name
    subject = @site_name + " - activation link"
    mail(to: @user.email, subject: subject)
  end

  def welcome_email(user)
    @user = user
    @account = Account.find_by_user_id(@user.id)
    @site_name = Rails.configuration.x.site_name
    subject = 'Welcome to ' + @site_name
    mail(to: @user.email, subject: subject)
  end

end
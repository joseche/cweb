class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_one :activation
  has_one :account

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url,
        notice: "Welcome back!"
    else
      render "new"
    end
  end

  def send_activation_email
    self.activation =  Activation.new
    begin
      UserMailer.welcome_email(self).deliver_now
    rescue
      logger.info "#{$!}"
      UserMailer.welcome_email(self).deliver_later
    end
  end

  def activate(key)
    if self.activation != nil and self.activation.key == key

      # activate this user, remove activation row
      self.active= true
      self.save
      self.activation.delete

      # and create his internal account
      self.account = Account.new
      self.account.name = self.email
      self.account.save

      return true
    else
      return false
    end
  end

  private
  def user_params
    params.require(:user).permit(:fullname, :email, :password, :password_confirmation)
  end
end
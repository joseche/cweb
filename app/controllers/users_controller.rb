class UsersController < ApplicationController
  before_filter :login_required,
                :only => [ :show ]

  def show
    @user = User.find(params[:id])
    if not @fullname = @user.fullname
      @fullname = @user.email
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
        redirect_to root_url,
         notice: 'Please follow the link sent to your email in order to activate your account !'
    else
      render 'new'
    end
  end

  def activate
    @user = User.find(params[:id])
    activation_key = params[:key]

    if @user.activate(activation_key)
      redirect_to login_url,
          notice: 'Your account has been activated, you can now login'
    else
      logger.info 'False attempt to activate user: ',@user.id, 'ip: ', request.ip
      redirect_to login_url,
          alert: 'Error activating account'
    end

  end

  private
  def user_params
    params.require(:user).permit(:fullname, :email, :password,
                                 :password_confirmation)
  end
end

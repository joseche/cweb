class InstallController < ApplicationController
  before_filter :login_required

  def index
    @user = current_user
    @account = @user.account
    @api_token = @account.api_token
  end
end

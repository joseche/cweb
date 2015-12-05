class DashboardController < ApplicationController
  before_filter :login_required

  def index
    @hosts = current_account.hosts
  end
end

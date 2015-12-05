class HostController < ApplicationController
  before_filter :login_required
  def index
  end

  def show
    params.require(:host)
    if @host = current_account.hosts.find_by_signature(params[:host])
      @period = "15m"
    else
      redirect_to dashboard_url, alert: "Host not found"
    end
  end
end

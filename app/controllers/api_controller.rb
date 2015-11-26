class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :login_required

  def index
    req = request.request_parameters
    logger.info req.to_s
    render :json => :success
  end
end

class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :login_required

  rescue_from ActionController::ParameterMissing do |exc|
    errstrc = {
        error: 'Parameter missing',
        param: exc.param
    }
    render :json => errstrc, status: 406
  end

  def index
    req = request.request_parameters
    logger.info req.to_s
    render :json => :success
  end

  def host_register
    params.require(:fqdn)
    params.require(:signature)
    params.require(:internalip)

    args = { :fqdn => params[:fqdn],
             :signature => params[:signature],
             :internalip => params[:internalip],
             :clientip => request.ip.to_s
    }
    host = current_account.hosts.create (args)
    if host.save
      render :json => :success
    else
      render :json => host.errors.messages, :status => 409
    end
  end

  def error_render_method
    render :json => :failure
  end

  def host_settags
    params.require(:tags)
    params.require(:signature)

    if host = Host.find_by_signature(params[:signature])
      if host.account == current_account

        host.tags.where(usercreated: false).destroy_all
        tags = params[:tags].split(/,/)
        tags.each do |t|
          host.tags.create(:tagname => t)
        end
        render :json => {result: 'success' }
      else
        render :json => {result: 'Permission denied'}, :status => 403
      end
    else
      render :json => {result: 'Host not found'}, :status => 404
    end
  end

  def host_gettags
    params.require(:signature)
    if host = Host.find_by_signature(params[:signature])
      resp = []
      host.tags.each do |t|
        resp << { tagname: t.tagname, updated_at: t.updated_at }
      end
      render :json => resp
    else
      render :json => { error: 'Host not found' }, status: 404
    end
  end

  def host_collect_loadavg
    params.require(:signature)
    params.require(:data)

    if host = Host.find_by_signature(params[:signature])
      response = host.collect_loadavg (params[:data])
      render :json => response
    else
      render :json => { error: 'Host not found' }, status: 404
    end
  end

  def host_collect_cputimes
    params.require(:signature)
    params.require(:data)

    if host = Host.find_by_signature(params[:signature])
      response = host.collect_cputimes (params[:data])
      render :json => response
    else
      render :json => { error: 'Host not found' }, status: 404
    end
  end

end

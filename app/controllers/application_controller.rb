class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      if token = request.env['HTTP_AUTHENTICATION']
        if @account = Account.find_by_api_token(token)
          session[:user_id] = @account.user.id
          @current_user ||= User.find(session[:user_id])
        else
          return false
        end
      else
        return false
      end
    end
  end
  helper_method :current_user

  def login_required
    if current_user
      return true
    else
      session[:return_to]=request.fullpath
      redirect_to login_path,
                alert: 'Please login to continue'
      return false
    end
  end

end

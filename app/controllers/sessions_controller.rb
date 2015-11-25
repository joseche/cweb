class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      # redirect_to dashboard_url, notice: "Log in successful!"
      if session[:return_to] == nil
        redirect_to dashboard_url, notice: "Log in successful!"
      else
        return_to = session[:return_to]
        session[:return_to]=nil
        redirect_to return_to, notice: "Log in successful!"
      end


    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Log out successful!"
  end
end
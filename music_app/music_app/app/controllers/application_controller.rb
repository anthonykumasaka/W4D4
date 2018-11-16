class ApplicationController < ActionController::Base
  helper_method :current_user
  #current_user, #logged_in?, #log_in_user!
  def log_in_user!(user)
    debugger
    
    session[:session_token] = user.reset_session_token!
    #do i need to redicrect?
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!@current_user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end


end

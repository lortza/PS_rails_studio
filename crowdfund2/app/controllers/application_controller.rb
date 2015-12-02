class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end #current_user
  helper_method :current_user


  def current_user?(user)
    current_user == user 
  end #current_user?(user)
  helper_method :current_user?
    

  def require_signin
    unless current_user
      session[:intended_url] = request.url #uses Ruby "request" to store the url the user was trying to go to before getting redirected to sign in
      redirect_to new_session_url, alert: "Please sign in first!"
    end #unless
  end #require_signin


end #ApplicationController

module ApplicationHelper
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end #current_user
    
end #ApplicationHelper

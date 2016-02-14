module AccountHelper
    
  def log_in(user)
    log_out
  	session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
  end
  
  def logged_in?
	!session[:user].nil?
  end
  
  def current_user
	User.find_by(id: session[:user])
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Store the URL given by the user to redirect him after login
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
    
end

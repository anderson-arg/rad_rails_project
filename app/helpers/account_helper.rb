module AccountHelper
    
  def log_in(user)
    log_out
  	session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
  end
  
  def logged_in?
	  !session[:user_id].nil?
  end
  
  def current_user
	  User.find_by(id: session[:user_id])
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Store the URL given by the user to redirect him after login
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def gravatar_for(user = current_user, options = {size: 30})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      default_url = "#{root_url}images/user.png"
      gravatar_url = user.photo.nil? ? "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=#{CGI.escape(default_url)}" : user.photo
      image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle", width: size)
  end
    
end

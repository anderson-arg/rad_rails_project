class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include AccountHelper
  
  private
    #prevent unauthenticated users
    def logged_in_user
	    unless logged_in?
        store_location
        flash[:danger] = 'Por Favor, realize o login para acessar a página.'
        redirect_to login_url
      end
    end

  	def logged_out_user
  	  if logged_in? 
  	    redirect_to root_url
      end
    end
  
end

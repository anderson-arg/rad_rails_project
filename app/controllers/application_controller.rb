class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include AccountHelper
  
  before_action :set_locale
 
  def set_locale
    if !cookies[:locale] || params[:locale]
      cookies[:locale] = params[:locale] || I18n.default_locale
    end
    
    I18n.locale = params[:locale] || cookies[:locale]
  end
  
  # app/controllers/application_controller.rb
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
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

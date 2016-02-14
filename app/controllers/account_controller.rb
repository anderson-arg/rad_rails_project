class AccountController < ApplicationController
    before_action :logged_out_user, only: [:index, :create, :destroy]
    
    def index
        @user = User.new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_back_or root_url
        else
          #create an error message
          @user = User.new
          flash.now[:danger] = t('controllers.sessions.create.flash.error')
          render 'new'
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
    
end

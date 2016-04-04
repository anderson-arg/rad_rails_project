class AccountController < ApplicationController
    before_action :logged_out_user, only: [:index, :create]
    
    def index
        @user = User.new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            flash[:success] = t('texts.welcome') + user.name + "!  :)"
            redirect_back_or lists_path
        else
          #create an error message
          @user = User.new
          flash.now[:danger] = t('controllers.account.login.error')
          render 'index'
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
    
end

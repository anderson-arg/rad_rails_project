class ContactController < ApplicationController
    
    def index
        @contact = Contact.new
    end
    
    def send_email
        @contact = Contact.new(form_params)
        UserMailer.contact(@contact).deliver_now
        if @contact.save
            flash[:success] = t('controllers.contact.success')
        end
        
        render 'index'
    end
    
    private
        def form_params
          params.require(:contact).permit(:name, :email, :message)
        end
        
end

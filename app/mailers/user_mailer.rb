class UserMailer < ApplicationMailer
    default from: 'ecommercerails@gmail.com'
    def contact(contact)
        @contact = contact
        mail(to: 'artuur.benicio@gmail.com', subject: 'Contato')
    end
end

Rails.application.routes.draw do

    

    scope "(:locale)", locale: /en|pt/ do
        root   to:	'home#index'
        
        get 'login'             => 'account#index'
        post 'login'            => 'account#create'
        delete 'logout'         => 'account#destroy', :as => :logout
        
        get 'about'             => 'about#index', :as => :about
        get 'contact'             => 'contact#index', :as => :contact
        post 'contact'             => 'contact#send_email', :as => :send_email
          
        resources :lists do
            resources :items, only: [:index, :new, :create, :edit, :destroy, :update]
        end
        
        resources :users
    end
end

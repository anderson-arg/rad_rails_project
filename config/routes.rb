Rails.application.routes.draw do
    
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
    
    scope "(:locale)", locale: /en|pt/, :defaults => { :format => 'html' } do
        root   to:	'home#index'
        
        get 'login'             => 'account#index'
        post 'login'            => 'account#create'
        delete 'logout'         => 'account#destroy', :as => :logout
        
        get 'about'             => 'about#index', :as => :about
        get 'contact'             => 'contact#index', :as => :contact
        post 'contact'             => 'contact#send_email', :as => :send_email
          
        resources :lists, only: [:index, :show] do
            resources :items, only: [:index, :show]
        end
        
        resources :users, :constraints => { :id => /.+@.+\.[a-zA-Z1-9_]*|[0-9]+/ } do
            resources :lists, :constraints => { :user_id => /.+@.+\.[a-zA-Z1-9_]*|[0-9]+/ } do
                resources :items, only: [:index, :show, :new, :create, :edit, :destroy, :update]
            end
        end
    end
end

Rails.application.routes.draw do
  
  root   to:	'home#index'
  
  get 'login'             => 'account#index'
	post 'login'            => 'account#create'
	delete 'logout'         => 'account#destroy', :as => :logout
	
	get 'about'             => 'about#index', :as => :about
	get 'contact'             => 'contact#index', :as => :contact
  
  resources :lists do
    resources :items, only: [:index, :new, :create, :edit, :destroy, :update]
  end
  
  resources :users
  
end

Rails.application.routes.draw do
  
  root   to:	'home#index'
  
  resources :lists do
    resources :items, only: [:index, :new, :create, :edit, :destroy, :update]
  end
  
end

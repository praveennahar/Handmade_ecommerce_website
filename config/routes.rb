Rails.application.routes.draw do
  namespace :customer do
    get '/order_place', :to => 'checkouts#orderplace'
    resources :carts ,:products , :orders, :checkouts
  end
  # get 'categories/index'

  namespace :seller do
    resources :products
  end

  namespace :admin do
    resources :main
  end
  
  root to: "main#index"
  
  resources :main, :categories,:admin, :seller,:products
  devise_for :accounts, controllers: {
        sessions: 'accounts/sessions',
        registrations: 'accounts/registrations'
      }


end

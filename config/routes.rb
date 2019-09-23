Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :users do
  resource :profile
  resources :users, only: [:show]
  end
  
  resources :locations
  
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  resources :posts
  get 'contact-us', to: 'contacts#new', as: 'new_contact'
end

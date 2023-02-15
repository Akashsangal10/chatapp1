Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'users/show'
  # get 'rooms/index'
  resources :rooms do 
    resources :messages
  end
  root 'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do 
    get "users", to: "devise/sessions#new"
  end
  get 'user/:id', to: 'users#show', as: 'user'
  
end

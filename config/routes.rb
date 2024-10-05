Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'profile', to: 'pages#profile'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  authenticate :user do
    resources :journals
  end
end

Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'profile', to: 'pages#profile'

  devise_for :users

  authenticate :user do
    resources :journals
  end
end

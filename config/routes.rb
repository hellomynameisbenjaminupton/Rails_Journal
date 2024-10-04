Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  devise_for :users

  authenticate :user do
    resources :journals
  end
end

Rails.application.routes.draw do
  root to: 'site#home'
  get 'site/home'

  # devise_for :users
  devise_for :users , controllers: { registrations: 'users/registrations' }

  resources :activities
end

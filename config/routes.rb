Rails.application.routes.draw do
  root to: 'site#home'
  get 'site/home'

  devise_for :users

  resources :activities
end

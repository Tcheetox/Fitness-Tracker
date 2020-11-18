Rails.application.routes.draw do
  root to: 'site#home'
 
  match "/twilio", to: "twilio#index", via: [:post]

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :activities
end

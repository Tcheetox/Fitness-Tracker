Rails.application.routes.draw do
  root to: 'site#home'

  match '/twilio', to: 'twilio#index', via: %i[post]

  devise_for :users, controllers: { registrations: 'users/registrations' } #match '/users', to: 'users#edit', via: %i[get]

  resources :activities
end

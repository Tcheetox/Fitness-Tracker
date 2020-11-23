Rails.application.routes.draw do
  # TODO: add redirect for anything before path?!
  scope(path: '/krenier/moveandgroove') do
    root to: 'site#home'

    match '/twilio', to: 'twilio#index', via: %i[post]

    devise_for :users, controllers: { registrations: 'users/registrations' } #match '/users', to: 'users#edit', via: %i[get]

    resources :activities
  end
end

# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController # https://github.com/heartcombo/devise#omniauth
  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

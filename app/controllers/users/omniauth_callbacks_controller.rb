# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController # end #   super(scope) # def after_omniauth_failure_path_for(scope) # The path used when OmniAuth fails # protected # end #   super # def failure # GET|POST /users/auth/twitter/callback # end #   super # def passthru # GET|POST /resource/auth/twitter # https://github.com/heartcombo/devise#omniauth
end

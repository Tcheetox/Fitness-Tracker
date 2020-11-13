# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController # protected # end #   super # def destroy # DELETE /resource/sign_out # end #   super # def create # POST /resource/sign_in # end #   super # def new # GET /resource/sign_in # before_action :configure_sign_in_params, only: [:create]
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(
  #     :sign_in,
  #     keys: %i[attribute]
  #   )
  # end
end

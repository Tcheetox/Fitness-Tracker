# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController # end #   super # def new # GET /resource/sign_in # before_action :configure_sign_in_params, only: [:create]
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(
  #     :sign_in,
  #     keys: %i[attribute]
  #   )
  # end
end

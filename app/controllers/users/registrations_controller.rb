# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: %i[update]

  # GET /resource/edit
  #def edit
  #  super
  #end

  # devise_parameter_sanitizer.permit(:account_update, keys: %i[attribute])
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # def update
  #   require 'logger'
  #   logger = Logger.new(STDOUT)
  #   logger.info "FOCKING HELL"
  # end

  protected # TODO: ask Dioni about this nasty trick
  def update_resource(resource, params)
    if %i[email password password_confirmation].any? { |k| params.key?(k) }
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[first_name last_name country phone gender]
    )
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

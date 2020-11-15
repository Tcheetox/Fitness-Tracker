# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController # protected # end #   super # def update # PUT /resource/password # end #   super # def edit # GET /resource/password/edit?reset_password_token=abcdef # end #   super # def create # POST /resource/password # end #   super # def new # GET /resource/password/new
  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

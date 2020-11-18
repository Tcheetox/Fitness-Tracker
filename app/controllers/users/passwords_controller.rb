# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController; end # end #   super(resource_name) # def after_sending_reset_password_instructions_path_for(resource_name) # The path used after sending reset password instructions # end #   super(resource) # def after_resetting_password_path_for(resource) # protected # end #   super # def update # PUT /resource/password # end #   super # def edit # GET /resource/password/edit?reset_password_token=abcdef # end #   super # def create # POST /resource/password # end #   super # def new # GET /resource/password/new

# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController # end #   super # def create # POST /resource/confirmation # end #   super # def new # GET /resource/confirmation/new
  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end

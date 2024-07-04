# frozen_string_literal: true

class Professors::RegistrationsController < Devise::RegistrationsController
  # GET /professors/sign_up
  # def new
  #   super
  # end

  # POST /professors
  # def create
  #   super
  # end

  # GET /professors/edit
  # def edit
  #   super
  # end

  # PUT /professors
  # def update
  #   super
  # end

  # DELETE /professors
  # def destroy
  #   super
  # end

  # GET /professors/cancel
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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

# frozen_string_literal: true

# Controlador para lidar com ações de sessão de alunos usando Devise.
class Alunos::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /alunos/sign_in
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /alunos/sign_in
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # DELETE /alunos/sign_out
  # Método padrão não sobrescrito.
  # def destroy
  #   super
  # end

  # protected

  # Se houver parâmetros extras para permitir, adicione-os ao sanitizador.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

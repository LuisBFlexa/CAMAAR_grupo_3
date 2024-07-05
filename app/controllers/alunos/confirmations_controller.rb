# frozen_string_literal: true

# Controlador para lidar com a confirmação de conta de alunos usando Devise.
class Alunos::ConfirmationsController < Devise::ConfirmationsController
  # GET /alunos/confirmation/new
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /alunos/confirmation
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # GET /alunos/confirmation?confirmation_token=abcdef
  # Método padrão não sobrescrito.
  # def show
  #   super
  # end

  # protected

  # O caminho usado após reenviar as instruções de confirmação.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # O caminho usado após a confirmação da conta.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end

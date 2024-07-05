# frozen_string_literal: true

# Controlador para gerenciar a confirmação de contas de professores usando Devise.
class Professors::ConfirmationsController < Devise::ConfirmationsController
  # GET /professors/confirmation/new
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /professors/confirmation
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # GET /professors/confirmation?confirmation_token=abcdef
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

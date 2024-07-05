# frozen_string_literal: true

# Controlador para gerenciar o desbloqueio de contas de alunos usando Devise.
class Alunos::UnlocksController < Devise::UnlocksController
  # GET /alunos/unlock/new
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /alunos/unlock
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # GET /alunos/unlock?unlock_token=abcdef
  # Método padrão não sobrescrito.
  # def show
  #   super
  # end

  # protected

  # O caminho usado após enviar instruções de desbloqueio de senha.
  # def after_sending_unlock_instructions_path_for(resource)
  #   super(resource)
  # end

  # O caminho usado após desbloquear o recurso.
  # def after_unlock_path_for(resource)
  #   super(resource)
  # end
end

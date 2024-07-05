# frozen_string_literal: true

# Controller personalizado para gerenciar o desbloqueio de contas de professores.
class Professors::UnlocksController < Devise::UnlocksController
  # GET /professors/unlock/new
  # Renderiza o formulário para solicitar o desbloqueio da conta do professor.
  # def new
  #   super
  # end

  # POST /professors/unlock
  # Envia as instruções para desbloqueio da conta do professor.
  # def create
  #   super
  # end

  # GET /professors/unlock?unlock_token=abcdef
  # Exibe a página de desbloqueio de conta do professor.
  # def show
  #   super
  # end

  # protected

  # Define o caminho após enviar as instruções de desbloqueio de senha.
  # def after_sending_unlock_instructions_path_for(resource)
  #   super(resource)
  # end

  # Define o caminho após desbloquear o recurso.
  # def after_unlock_path_for(resource)
  #   super(resource)
  # end
end

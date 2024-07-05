# frozen_string_literal: true

# Controller personalizado para lidar com a recuperação de senhas para a entidade Professor.
class Professors::PasswordsController < Devise::PasswordsController
  # GET /professors/password/new
  # Renderiza o formulário para solicitar a redefinição de senha.
  # def new
  #   super
  # end

  # POST /professors/password
  # Envia instruções para redefinição de senha para o e-mail fornecido.
  # def create
  #   super
  # end

  # GET /professors/password/edit?reset_password_token=abcdef
  # Renderiza o formulário para redefinir a senha utilizando o token de redefinição.
  # def edit
  #   super
  # end

  # PUT /professors/password
  # Atualiza a senha do professor no sistema.
  # def update
  #   super
  # end

  # protected

  # Define o caminho usado após a redefinição de senha.
  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # Define o caminho usado após o envio das instruções para redefinição de senha.
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

# frozen_string_literal: true

# Controlador para lidar com ações de redefinição de senha para alunos usando Devise.
class Alunos::PasswordsController < Devise::PasswordsController
  # GET /alunos/password/new
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /alunos/password
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # GET /alunos/password/edit?reset_password_token=abcdef
  # Método padrão não sobrescrito.
  # def edit
  #   super
  # end

  # PUT /alunos/password
  # Método padrão não sobrescrito.
  # def update
  #   super
  # end

  # protected

  # O caminho usado após redefinir a senha.
  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # O caminho usado após enviar instruções para redefinição de senha.
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end

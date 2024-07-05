# frozen_string_literal: true

# Controlador para lidar com ações de registro de alunos usando Devise.
class Alunos::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /alunos/sign_up
  # Método padrão não sobrescrito.
  # def new
  #   super
  # end

  # POST /alunos
  # Método padrão não sobrescrito.
  # def create
  #   super
  # end

  # GET /alunos/edit
  # Método padrão não sobrescrito.
  # def edit
  #   super
  # end

  # PUT /alunos
  # Método padrão não sobrescrito.
  # def update
  #   super
  # end

  # DELETE /alunos
  # Método padrão não sobrescrito.
  # def destroy
  #   super
  # end

  # GET /alunos/cancel
  # Força a expiração dos dados de sessão que geralmente expiram após o login para
  # expirar agora. Útil se o usuário deseja cancelar o login/up via OAuth no meio do processo,
  # removendo todos os dados de sessão do OAuth.
  # def cancel
  #   super
  # end

  # protected

  # Se houver parâmetros extras para permitir, adicione-os ao sanitizador.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # Se houver parâmetros extras para permitir, adicione-os ao sanitizador.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # O caminho usado após o registro.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # O caminho usado após o registro para contas inativas.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

# frozen_string_literal: true

# Controller personalizado para gerenciar o processo de registro de professores.
class Professors::RegistrationsController < Devise::RegistrationsController
  # GET /professors/sign_up
  # Renderiza o formulário para registrar um novo professor.
  # def new
  #   super
  # end

  # POST /professors
  # Cria um novo registro de professor com os dados fornecidos.
  # def create
  #   super
  # end

  # GET /professors/edit
  # Renderiza o formulário para editar o perfil do professor.
  # def edit
  #   super
  # end

  # PUT /professors
  # Atualiza os dados do perfil do professor.
  # def update
  #   super
  # end

  # DELETE /professors
  # Remove o registro do professor.
  # def destroy
  #   super
  # end

  # GET /professors/cancel
  # Cancela a sessão de OAuth durante o processo de registro ou login.
  # def cancel
  #   super
  # end

  # protected

  # Permite parâmetros extras durante o registro.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # Permite parâmetros extras durante a atualização da conta.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # Define o caminho utilizado após o registro.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # Define o caminho utilizado após o registro de contas inativas.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

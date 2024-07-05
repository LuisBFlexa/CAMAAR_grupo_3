# frozen_string_literal: true

# Controller personalizado para gerenciar as sessões de professores.
class Professors::SessionsController < Devise::SessionsController
  # GET /professors/sign_in
  # Renderiza o formulário para login do professor.
  # def new
  #   super
  # end

  # POST /professors/sign_in
  # Cria uma nova sessão de login para o professor.
  # def create
  #   super
  # end

  # DELETE /professors/sign_out
  # Destroi a sessão de login do professor.
  # def destroy
  #   super
  # end

  # protected

  # Permite parâmetros extras durante o login.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

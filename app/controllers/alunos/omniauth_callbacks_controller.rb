# frozen_string_literal: true

# Controlador para lidar com callbacks de autenticação OAuth para alunos usando Devise.
class Alunos::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Você deve configurar seu modelo assim:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # Você também deve criar um método de ação neste controlador assim:
  # def twitter
  # end

  # Mais informações em:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /alunos/auth/twitter
  # Método padrão não sobrescrito.
  # def passthru
  #   super
  # end

  # GET|POST /alunos/auth/twitter/callback
  # Método padrão não sobrescrito.
  # def failure
  #   super
  # end

  # protected

  # O caminho usado quando o OmniAuth falha.
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

# frozen_string_literal: true

# Controlador para gerenciar callbacks de autenticação OmniAuth para professores usando Devise.
class Professors::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Configuração do modelo para permitir OmniAuth com provedores específicos.
  # Exemplos de configuração:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # Criação de métodos de ação para diferentes provedores de autenticação.
  # Exemplo:
  # def twitter
  # end

  # Mais informações em:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /professors/auth/twitter
  # Método padrão não sobrescrito.
  # def passthru
  #   super
  # end

  # GET|POST /professors/auth/twitter/callback
  # Método padrão não sobrescrito.
  # def failure
  #   super
  # end

  # protected

  # O caminho usado quando OmniAuth falha.
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end

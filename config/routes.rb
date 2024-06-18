Rails.application.routes.draw do
  devise_for :professors, controllers: {
    sessions: 'professors/sessions'
  }
  devise_for :alunos, controllers: {
    sessions: 'alunos/sessions'
  }

  get 'home/index'
  resources :reports_professors
  resources :reports_alunos
  resources :formulario_templates
  resources :formularios
  resources :departamentos
  resources :materia

  authenticated :aluno do
    root 'alunos#dashboard', as: :authenticated_aluno_root
  end

  authenticated :professor do
    root 'professors#dashboard', as: :authenticated_professor_root
  end

  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end

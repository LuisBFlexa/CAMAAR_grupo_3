# Controller responsável pela gestão dos professores.
class ProfessorsController < ApplicationController
  before_action :authenticate_professor!

  # GET /dashboard
  # 
  # Exibe o painel de controle do professor.
  # 
  # Não recebe argumentos.
  # 
  # Não retorna valor diretamente visível ao usuário, realiza redirecionamentos com base no tipo de acesso do professor.
  # 
  # Pode redirecionar para a página de edição de templates se o professor for um administrador.
  # Pode redirecionar para a página de relatórios dos alunos se o professor não for um administrador.
  def dashboard
    if current_professor.isadmin?
      @templates = FormularioTemplate.all
      redirect_to edit_template_path(@templates.first)
    else
      @formularios = current_professor.formularios
      redirect_to reports_alunos_path
    end
  end
end

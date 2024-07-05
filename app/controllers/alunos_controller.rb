# Controller responsável por ações relacionadas aos alunos.
class AlunosController < ApplicationController
  # Antes de executar qualquer ação, verifica se o aluno está autenticado.
  before_action :authenticate_aluno!

  # Ação que renderiza o dashboard do aluno.
  def dashboard
    # Obtém todos os formulários disponíveis.
    @formularios = Formulario.all

    # Redireciona para a rota de relatórios dos alunos.
    redirect_to reports_alunos_path
  end
end

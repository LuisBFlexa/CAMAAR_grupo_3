# Controller responsável por gerenciar os relatórios dos alunos na aplicação.
class ReportsAlunosController < ApplicationController
  before_action :set_reports_aluno, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:submit_form]

  # GET /reports_alunos or /reports_alunos.json
  def index
    # Obtém todos os relatórios de alunos existentes.
    @reports_alunos = ReportsAluno.all
    # Obtém os nomes dos arquivos JSON no diretório de formulários públicos.
    @formularios = Dir.glob(Rails.root.join('public', 'formularios', '*.json')).map do |file_path|
      File.basename(file_path)
    end
  end

  # GET /fetch_form
  # Recupera o conteúdo de um formulário JSON específico.
  #
  # Parameters:
  #   - params[:file_name]: Nome do arquivo JSON a ser recuperado.
  #
  # Returns JSON content of the requested form or error message if not found.
  def fetch_form
    form_content = FormSubmissionService.fetch_form(params[:file_name])

    if form_content
      render json: form_content
    else
      render json: { error: "File not found" }, status: 404
    end
  end

  # POST /submit_form
  # Submete um formulário preenchido como um arquivo JSON.
  #
  # Request body JSON parameters:
  #   - fileName: Nome do arquivo a ser salvo.
  #   - data: Dados preenchidos do formulário.
  #   - formName: Nome do formulário.
  #   - professor: Nome do professor associado ao formulário.
  #   - semester: Semestre associado ao formulário.
  #
  # Returns JSON indicating success or failure of the submission.
  def submit_form
    begin
      json_data = JSON.parse(request.body.read)
      file_path = FormSubmissionService.save_submission(json_data)
      render json: { success: true, file_path: file_path }
    rescue => e
      render json: { success: false, error: e.message }, status: 500
    end
  end

  # GET /reports_alunos/1 or /reports_alunos/1.json
  # Mostra detalhes de um relatório de aluno específico.
  def show; end

  # GET /reports_alunos/new
  # Inicializa um novo relatório de aluno.
  def new
    @reports_aluno = ReportsAluno.new
  end

  # GET /reports_alunos/1/edit
  # Permite editar um relatório de aluno existente.
  def edit; end

  # POST /reports_alunos or /reports_alunos.json
  # Cria um novo relatório de aluno com os parâmetros permitidos.
  def create
    @reports_aluno = ReportsAluno.new(reports_aluno_params)
    handle_response(@reports_aluno.save, :new, "Reports aluno foi criado com sucesso.")
  end

  # PATCH/PUT /reports_alunos/1 or /reports_alunos/1.json
  # Atualiza um relatório de aluno existente com os parâmetros permitidos.
  def update
    handle_response(@reports_aluno.update(reports_aluno_params), :edit, "Reports aluno foi atualizado com sucesso.")
  end

  # DELETE /reports_alunos/1 or /reports_alunos/1.json
  # Deleta um relatório de aluno existente.
  def destroy
    @reports_aluno.destroy!
    handle_response(true, :index, "Reports aluno foi deletado com sucesso.")
  end

  private

  # Configura o relatório de aluno antes de executar certas ações.
  def set_reports_aluno
    @reports_aluno = ReportsAluno.find(params[:id])
  end

  # Permite apenas uma lista de parâmetros confiáveis (strong parameters).
  def reports_aluno_params
    params.require(:reports_aluno).permit(:formulario_id)
  end

  # Maneja a resposta após as operações de criação, atualização ou deleção.
  def handle_response(success, action, success_message)
    if success
      redirect_to @reports_aluno, notice: success_message
    else
      render action, status: :unprocessable_entity
    end
  end
end

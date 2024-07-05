class ReportsAlunosController < ApplicationController
  before_action :set_reports_aluno, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, only: [:submit_form]

  # GET /reports_alunos or /reports_alunos.json
  def index
    @reports_alunos = ReportsAluno.all
    @formularios = FileService.list_files(Rails.root.join('public', 'formularios'), '*.json')
  end

  # GET /fetch_form
  def fetch_form
    form_content = FormSubmissionService.fetch_form(params[:file_name])

    if form_content
      render json: form_content
    else
      render json: { error: "File not found" }, status: 404
    end
  end

  # POST /submit_form
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
  def show; end

  # GET /reports_alunos/new
  def new
    @reports_aluno = ReportsAluno.new
  end

  # GET /reports_alunos/1/edit
  def edit; end

  # POST /reports_alunos or /reports_alunos.json
  def create
    @reports_aluno = ReportsAluno.new(reports_aluno_params)
    handle_response(@reports_aluno.save, :new, "Reports aluno was successfully created.")
  end

  # PATCH/PUT /reports_alunos/1 or /reports_alunos/1.json
  def update
    handle_response(@reports_aluno.update(reports_aluno_params), :edit, "Reports aluno was successfully updated.")
  end

  # DELETE /reports_alunos/1 or /reports_alunos/1.json
  def destroy
    @reports_aluno.destroy!
    handle_response(true, :index, "Reports aluno was successfully destroyed.")
  end

  private

  def set_reports_aluno
    @reports_aluno = ReportsAluno.find(params[:id])
  end

  def reports_aluno_params
    params.require(:reports_aluno).permit(:formulario_id)
  end

  def handle_response(success, action, success_message)
    if success
      redirect_to @reports_aluno, notice: success_message
    else
      render action, status: :unprocessable_entity
    end
  end
end

class FormulariosController < ApplicationController
  protect_from_forgery with: :null_session, only: :save_formulario

  before_action :set_formulario, only: %i[show edit update destroy]
  before_action :set_templates, only: %i[index new]

  # GET /formularios
  def index
    @formularios = Formulario.all
    @files = FileService.list_files("#{Rails.root}/public/formularios", "*.json")
  end

  # GET /formularios/1
  def show; end

  # GET /formularios/new
  def new
    @formulario = Formulario.new
  end

  # GET /formularios/1/edit
  def edit; end

  # POST /formularios
  def create
    @formulario = Formulario.new(formulario_params)
    handle_response(@formulario.save, :new, "Formulario foi criado com sucesso.")
  end

  # PATCH/PUT /formularios/1
  def update
    handle_response(@formulario.update(formulario_params), :edit, "Formulario foi atualizado com sucesso.")
  end

  # DELETE /formularios/1
  def destroy
    @formulario.destroy
    handle_response(true, :index, "Formulario foi deletado com sucesso.")
  end

  # POST /save_formulario
  def save_formulario
    form_data = FormularioService.sanitized_form_data(params)
    safe_file_name = FormularioService.generate_safe_file_name(form_data)

    FileService.save_file("#{Rails.root}/public/formularios", safe_file_name, form_data.to_json)
    FormularioService.create_response_directory(safe_file_name)

    render json: { status: 'success', message: 'Formulário salvo com sucesso' }
  end

  # GET /view_file_form
  def view_file_form
    file_content = FileService.read_file("#{Rails.root}/public/formularios/#{params[:file_name]}")

    if file_content
      render json: { status: 'success', content: file_content }
    else
      render json: { status: 'error', message: 'File not found' }
    end
  end

  # DELETE /delete_file_form
  def delete_file_form
    file_name = params[:file_name]
    file_path = Rails.root.join('public', 'formularios', file_name)

    if FileService.delete_file(file_path)
      FormularioService.delete_response_directory(file_name)
      render json: { status: 'success', message: 'Arquivo deletado com sucesso' }
    else
      render json: { status: 'error', message: 'Arquivo não encontrado' }
    end
  end

  # GET /get_response_files
  def get_response_files
    responses = FormularioService.fetch_response_files(params[:form_name], params[:question_key])
    render json: { responses: responses }
  end

  # GET /count_responses
  def count_responses
    total_responses = count_files_in_directory(params[:form_name], params[:professor], params[:semester])
    render json: { totalResponses: total_responses }
  end

  private

  def set_templates
    @templates = FileService.list_files("#{Rails.root}/public/templates", "*.json").map { |file| File.basename(file, ".json") }
  end

  def set_formulario
    @formulario = Formulario.find(params[:id])
  end

  def formulario_params
    params.require(:formulario).permit(:template_usado, :perguntas)
  end

  def handle_response(success, action, success_message)
    if success
      redirect_to @formulario, notice: success_message
    else
      render action, status: :unprocessable_entity
    end
  end

  def count_files_in_directory(form_name, professor, semester)
    response_path = Rails.root.join('public', 'respostas', "#{form_name}-#{professor}-#{semester}")
    Dir.glob("#{response_path}/*.json").count
  end
end

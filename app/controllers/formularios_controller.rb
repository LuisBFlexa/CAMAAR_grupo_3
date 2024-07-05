# Controller responsável por gerenciar os formulários na aplicação.
class FormulariosController < ApplicationController
  # Protege contra ataques CSRF desabilitando a verificação de autenticidade apenas para a ação save_formulario.
  protect_from_forgery with: :null_session, only: :save_formulario

  # Antes de executar as ações show, edit, update e destroy, configura o formulário.
  before_action :set_formulario, only: %i[show edit update destroy]
  before_action :set_templates, only: %i[index new]

  # GET /formularios ou /formularios.json
  def index
    # Obtém todos os formulários existentes.
    @formularios = Formulario.all
    # Obtém os nomes dos arquivos JSON no diretório de formulários públicos.
    @files = Dir.glob("#{Rails.root}/public/formularios/*.json").map { |file| File.basename(file) }
  end

  # GET /formularios/1 ou /formularios/1.json
  def show
    # Ação que mostra detalhes de um formulário específico.
  end

  # GET /formularios/new
  def new
    # Inicializa um novo objeto formulário.
    @formulario = Formulario.new
  end

  # GET /formularios/1/edit
  def edit
    # Ação que permite editar um formulário existente.
  end

  # POST /formularios ou /formularios.json
  def create
    # Cria um novo formulário com os parâmetros permitidos.
    @formulario = Formulario.new(formulario_params)

    handle_response(@formulario.save, :new, "Formulário foi criado com sucesso.")
  end

  # PATCH/PUT /formularios/1 ou /formularios/1.json
  def update
    handle_response(@formulario.update(formulario_params), :edit, "Formulário foi atualizado com sucesso.")
  end

  # DELETE /formularios/1 ou /formularios/1.json
  def destroy
    @formulario.destroy
    handle_response(true, :index, "Formulário foi deletado com sucesso.")
  end

  # POST /save_formulario.json
  def save_formulario
    # Salva um formulário como arquivo JSON no diretório público.
    form_data = FormularioService.sanitized_form_data(params)
    safe_file_name = FormularioService.generate_safe_file_name(form_data)

    FileService.save_file("#{Rails.root}/public/formularios", safe_file_name, form_data.to_json)
    FormularioService.create_response_directory(safe_file_name)

    render json: { status: 'success', message: 'Formulário salvo com sucesso' }
  end

  # GET /view_file_form.json
  def view_file_form
    # Visualiza o conteúdo de um arquivo JSON de formulário específico.
    file_content = FileService.read_file("#{Rails.root}/public/formularios/#{params[:file_name]}")

    if file_content
      render json: { status: 'success', content: file_content }
    else
      render json: { status: 'error', message: 'File not found' }
    end
  end

  # DELETE /delete_file_form.json
  def delete_file_form
    # Deleta um arquivo JSON de formulário específico e seu diretório de resposta correspondente.
    file_name = params[:file_name]
    file_path = Rails.root.join('public', 'formularios', file_name)

    if FileService.delete_file(file_path)
      FormularioService.delete_response_directory(file_name)
      render json: { status: 'success', message: 'Arquivo deletado com sucesso' }
    else
      render json: { status: 'error', message: 'Arquivo não encontrado' }
    end
  end

  # GET /get_response_files.json
  def get_response_files
    # Obtém os arquivos de resposta para um formulário específico.
    responses = FormularioService.fetch_response_files(params[:form_name], params[:question_key])
    render json: { responses: responses }
  end

  # GET /count_responses.json
  def count_responses
    # Conta o número total de respostas para um formulário específico.
    total_responses = count_files_in_directory(params[:form_name], params[:professor], params[:semester])
    render json: { totalResponses: total_responses }
  end

  private

  # Lista os templates de formulário disponíveis no diretório público.
  def list_templates
    Dir.glob("#{Rails.root}/public/templates/*.json").map { |file| File.basename(file, ".json") }
  end

  # Define os templates disponíveis para serem usados nos formulários.
  def set_templates
    @templates = list_templates
  end

  # Configura o formulário antes de executar certas ações.
  def set_formulario
    @formulario = Formulario.find(params[:id])
  end

  # Permite apenas uma lista de parâmetros confiáveis (strong parameters).
  def formulario_params
    params.require(:formulario).permit(:template_usado, :perguntas)
  end

  # Cria um diretório de resposta para armazenar arquivos de resposta.
  def create_response_directory(folder_name)
    dir_path = Rails.root.join('public', 'respostas', folder_name)
    Dir.mkdir(dir_path) unless Dir.exist?(dir_path)
  end

  # Deleta um diretório de resposta e todos os arquivos dentro dele.
  def delete_response_directory(folder_name)
    dir_path = Rails.root.join('public', 'respostas', folder_name)
    FileUtils.rm_rf(dir_path) if Dir.exist?(dir_path)
  end

  # Conta o número de arquivos em um diretório específico.
  def count_files_in_directory(form_name, professor, semester)
    response_path = Rails.root.join('public', 'respostas', "#{form_name}-#{professor}-#{semester}")
    Dir.glob("#{response_path}/*.json").count
  end

  # Maneja a resposta após as operações de criação, atualização ou deleção.
  def handle_response(success, action, success_message)
    if success
      redirect_to @formulario, notice: success_message
    else
      render action, status: :unprocessable_entity
    end
  end
end

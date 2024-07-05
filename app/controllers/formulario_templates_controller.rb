# Controller responsável por gerenciar os templates de formulários na aplicação.
class FormularioTemplatesController < ApplicationController
  before_action :set_formulario_template, only: %i[show edit update destroy]
  before_action :set_no_cache, only: %i[edit_template view_file delete_file]

  # GET /formulario_templates ou /formulario_templates.json
  def index
    # Obtém todos os templates de formulários existentes.
    @formulario_templates = FormularioTemplate.all
  end

  # GET /formulario_templates/1 ou /formulario_templates/1.json
  def show
    # Ação que mostra detalhes de um template de formulário específico.
  end

  # GET /formulario_templates/new
  def new
    # Inicializa um novo objeto template de formulário.
    @formulario_template = FormularioTemplate.new
  end

  # GET /formulario_templates/1/edit
  def edit
    # Ação que permite editar um template de formulário existente.
  end

  # GET /formulario_templates/edit_no_params
  def edit_template
    # Diretório onde os templates estão armazenados
    templates_dir = Rails.root.join('public', 'templates')
    
    # Seleciona arquivos JSON no diretório de templates
    @files = Dir.children(templates_dir).select { |file| file.end_with?('.json') }

    # Obtém o primeiro template de formulário (exemplo)
    @formulario_template = FormularioTemplate.first
    render :edit
  end

  # GET /view_file
  def view_file
    # Obtém o nome do arquivo a ser visualizado
    file_name = params[:file_name]
    file_path = Rails.root.join('public', 'templates', file_name)

    # Verifica se o arquivo existe e retorna seu conteúdo em formato JSON
    if File.exist?(file_path)
      content = File.read(file_path)
      render json: { status: 'success', content: content }
    else
      render json: { status: 'error', message: 'File not found' }, status: 404
    end
  end

  # DELETE /delete_file
  def delete_file
    # Obtém o nome do arquivo a ser deletado
    file_name = params[:file_name]
    file_path = Rails.root.join('public', 'templates', file_name)

    # Verifica se o arquivo existe e deleta-o
    if File.exist?(file_path)
      File.delete(file_path)
      render json: { status: 'success', message: 'File deleted successfully' }
    else
      render json: { status: 'error', message: 'File not found' }, status: 404
    end
  end

  # POST /formulario_templates ou /formulario_templates.json
  def create
    # Cria um novo template de formulário com os parâmetros recebidos
    @formulario_template = FormularioTemplate.new(formulario_template_params)

    handle_response(@formulario_template.save, :new, "Formulario template was successfully created.")
  end

  # PATCH/PUT /formulario_templates/1 ou /formulario_templates/1.json
  def update
    handle_response(@formulario_template.update(formulario_template_params), :edit, "Formulario template was successfully updated.")
  end

  # DELETE /formulario_templates/1 ou /formulario_templates/1.json
  def destroy
    @formulario_template.destroy
    handle_response(true, :index, "Formulario template was successfully destroyed.")
  end

  private

  def set_formulario_template
    @formulario_template = FormularioTemplate.find(params[:id])
  end

  def formulario_template_params
    params.require(:formulario_template).permit(:name, :content)
  end

  def set_no_cache
    headers = response.headers
    headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0"
    headers["Pragma"] = "no-cache"
    headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def handle_response(success, action, success_message)
    if success
      redirect_to @formulario_template, notice: success_message
    else
      render action, status: :unprocessable_entity
    end
  end
end

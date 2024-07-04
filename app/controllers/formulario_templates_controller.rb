# Controller responsável por gerenciar os templates de formulários na aplicação.
class FormularioTemplatesController < ApplicationController
  # Antes de executar as ações show, edit, update e destroy, configura o template de formulário.
  before_action :set_formulario_template, only: %i[ show edit update destroy ]

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

  # Configurações de cache para evitar armazenamento em cache de páginas.
  def set_no_cache
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
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
    @formulario_template = FormularioTemplate.first # ou outro critério
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

    respond_to do |format|
      if @formulario_template.save
        format.html { redirect_to @formulario_template, notice: 'Formulario template was successfully created.' }
        format.json { render :show, status: :created, location: @formulario_template }
      else
        format.html { render :new }
        format.json { render json: @formulario_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulario_templates/1 ou /formulario_templates/1.json
  def update
    respond_to do |format|
      if @formulario_template.update(formulario_template_params)
        format.html { redirect_to @formulario_template, notice: 'Formulario template was successfully updated.' }
        format.json { render :show, status: :ok, location: @formulario_template }
      else
        format.html { render :edit }
        format.json { render json: @formulario_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulario_templates/1 ou /formulario_templates/1.json
  def destroy
    @formulario_template.destroy
    respond_to do |format|
      format.html { redirect_to formulario_templates_url, notice: 'Formulario template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Método que configura os parâmetros permitidos para criação/atualização do template de formulário.
    def formulario_template_params
      params.require(:formulario_template).permit(:name, :description, :content)
    end

    # Método que define o template de formulário com base no ID recebido.
    def set_formulario_template
      @formulario_template = FormularioTemplate.find(params[:id])
    end
end


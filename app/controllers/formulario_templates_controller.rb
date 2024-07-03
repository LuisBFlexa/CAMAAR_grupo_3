class FormularioTemplatesController < ApplicationController
  before_action :set_formulario_template, only: %i[show edit update destroy]
  before_action :set_no_cache, only: %i[edit_template view_file delete_file]

  # GET /formulario_templates or /formulario_templates.json
  def index
    @formulario_templates = FormularioTemplate.all
  end

  # GET /formulario_templates/1 or /formulario_templates/1.json
  def show; end

  # GET /formulario_templates/new
  def new
    @formulario_template = FormularioTemplate.new
  end

  # GET /formulario_templates/1/edit
  def edit; end

  # GET /formulario_templates/edit_no_params
  def edit_template
    templates_dir = Rails.root.join('public', 'templates')
    @files = FileService.list_files(templates_dir, '*.json')
    @formulario_template = FormularioTemplate.first
    render :edit
  end

  # GET /view_file
  def view_file
    file_path = Rails.root.join('public', 'templates', params[:file_name])
    file_content = FileService.read_file(file_path)

    if file_content
      render json: { status: 'success', content: file_content }
    else
      render json: { status: 'error', message: 'File not found' }, status: 404
    end
  end

  # DELETE /delete_file
  def delete_file
    file_path = Rails.root.join('public', 'templates', params[:file_name])

    if FileService.delete_file(file_path)
      render json: { status: 'success', message: 'File deleted successfully' }
    else
      render json: { status: 'error', message: 'File not found' }, status: 404
    end
  end

  # POST /formulario_templates or /formulario_templates.json
  def create
    @formulario_template = FormularioTemplate.new(formulario_template_params)
    handle_response(@formulario_template.save, :new, "Formulario template was successfully created.")
  end

  # PATCH/PUT /formulario_templates/1 or /formulario_templates/1.json
  def update
    handle_response(@formulario_template.update(formulario_template_params), :edit, "Formulario template was successfully updated.")
  end

  # DELETE /formulario_templates/1 or /formulario_templates/1.json
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

class DepartamentosController < ApplicationController
  before_action :set_departamento, only: %i[show edit update destroy]

  # GET /departamentos or /departamentos.json
  def index
    @departamentos = Departamento.all
  end

  # GET /departamentos/1 or /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos or /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)
    process_request(@departamento.save, :new, "Departamento was successfully created.")
  end

  # PATCH/PUT /departamentos/1 or /departamentos/1.json
  def update
    process_request(@departamento.update(departamento_params), :edit, "Departamento was successfully updated.")
  end

  # DELETE /departamentos/1 or /departamentos/1.json
  def destroy
    @departamento.destroy
    process_destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_departamento
    @departamento = Departamento.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def departamento_params
    params.require(:departamento).permit(:nome)
  end

  # Handle request processing
  def process_request(success, render_action, success_message)
    respond_to do |format|
      if success
        format.html { redirect_to @departamento, notice: success_message }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render render_action, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  def process_destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: "Departamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end

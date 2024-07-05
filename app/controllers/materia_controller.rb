# Controller responsável pela gestão de disciplinas (materias).
class MateriasController < ApplicationController
  before_action :set_materia, only: %i[show edit update destroy]

  # GET /materias or /materias.json
  #
  # Lists all registered disciplines.
  def index
    @materias = Materia.all
  end

  # GET /materias/1 or /materias/1.json
  #
  # Shows details of a specific discipline.
  def show
  end

  # GET /materias/new
  #
  # Initializes a form for creating a new discipline.
  def new
    @materia = Materia.new
  end

  # GET /materias/1/edit
  #
  # Initializes a form for editing an existing discipline.
  def edit
  end

  # POST /materias or /materias.json
  #
  # Creates a new discipline based on the provided parameters.
  def create
    @materia = Materia.new(materia_params)

    respond_to do |format|
      if @materia.save
        format.html { redirect_to materia_url(@materia), notice: "Discipline was successfully created." }
        format.json { render :show, status: :created, location: @materia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materias/1 or /materias/1.json
  #
  # Updates an existing discipline based on the provided parameters.
  def update
    respond_to do |format|
      if @materia.update(materia_params)
        format.html { redirect_to materia_url(@materia), notice: "Discipline was successfully updated." }
        format.json { render :show, status: :ok, location: @materia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materias/1 or /materias/1.json
  #
  # Deletes an existing discipline from the database.
  def destroy
    @materia.destroy
    respond_to do |format|
      format.html { redirect_to materias_url, notice: "Discipline was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /materias/search_in_sigaa
  #
  # Performs a search in SIGAA for new discipline classes.
  def search_in_sigaa
    # Implementation details are within the action body.
  end

  # POST /materias/update_with_sigaa_data
  #
  # Updates existing disciplines with data obtained from SIGAA.
  def update_with_sigaa_data
    # Implementation details are within the action body.
  end

  private

  # Sets the discipline based on the ID.
  def set_materia
    @materia = Materia.find(params[:id])
  end

  # Permitted parameters for creating/updating a discipline.
  def materia_params
    params.require(:materia).permit(:codigo, :semestre, :nome, :departamento_id, :professor_id, :aluno_id, :forms_materia)
  end
end

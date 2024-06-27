class ReportsProfessorsController < ApplicationController
  before_action :set_reports_professor, only: %i[show edit update destroy]

  # GET /reports_professors or /reports_professors.json
  def index
    @reports_professors = ReportsProfessor.all
  end

  # GET /reports_professors/1 or /reports_professors/1.json
  def show
  end

  # GET /reports_professors/new
  def new
    @reports_professor = ReportsProfessor.new
  end

  # GET /reports_professors/1/edit
  def edit
  end

  # POST /reports_professors or /reports_professors.json
  def create
    @reports_professor = ReportsProfessor.new(reports_professor_params)
    if @reports_professor.save
      handle_success(:created, @reports_professor, 'created')
    else
      handle_failure(:new)
    end
  end

  # PATCH/PUT /reports_professors/1 or /reports_professors/1.json
  def update
    if @reports_professor.update(reports_professor_params)
      handle_success(:ok, @reports_professor, 'updated')
    else
      handle_failure(:edit)
    end
  end

  # DELETE /reports_professors/1 or /reports_professors/1.json
  def destroy
    @reports_professor.destroy!
    respond_to do |format|
      format.html { redirect_to reports_professors_url, notice: 'Reports professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reports_professor
    @reports_professor = ReportsProfessor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reports_professor_params
    params.require(:reports_professor).permit(:formulario_id)
  end

  # Handle successful save or update
  def handle_success(status, reports_professor, action)
    respond_to do |format|
      format.html { redirect_to reports_professor_url(reports_professor), notice: "Reports professor was successfully #{action}." }
      format.json { render :show, status: status, location: reports_professor }
    end
  end

  # Handle failure to save or update
  def handle_failure(render_action)
    respond_to do |format|
      format.html { render render_action, status: :unprocessable_entity }
      format.json { render json: @reports_professor.errors, status: :unprocessable_entity }
    end
  end
end

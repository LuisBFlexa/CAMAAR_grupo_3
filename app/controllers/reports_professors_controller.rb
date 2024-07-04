# Controller responsável por gerenciar os relatórios dos professores na aplicação.
class ReportsProfessorsController < ApplicationController
  before_action :set_reports_professor, only: %i[show edit update destroy]

  # GET /reports_professors ou /reports_professors.json
  #
  # Obtém todos os relatórios de professores existentes.
  def index
    @reports_professors = ReportsProfessor.all
  end

  # GET /reports_professors/1 ou /reports_professors/1.json
  #
  # Mostra detalhes de um relatório de professor específico.
  def show
  end

  # GET /reports_professors/new
  #
  # Inicializa um novo relatório de professor.
  def new
    @reports_professor = ReportsProfessor.new
  end

  # GET /reports_professors/1/edit
  #
  # Permite editar um relatório de professor existente.
  def edit
  end

  # POST /reports_professors ou /reports_professors.json
  #
  # Cria um novo relatório de professor com os parâmetros permitidos.
  #
  # Parâmetros permitidos:
  #   - reports_professor_params: Parametros aceitos para criar o relatório de professor.
  #
  # Retorna:
  #   - HTML: Redireciona para a página do relatório criado com uma mensagem de sucesso.
  #   - JSON: Retorna o status de criação e a localização do relatório.
  def create
    @reports_professor = ReportsProfessor.new(reports_professor_params)
    if @reports_professor.save
      handle_success(:created, @reports_professor, 'criado')
    else
      handle_failure(:new)
    end
  end

  # PATCH/PUT /reports_professors/1 ou /reports_professors/1.json
  #
  # Atualiza um relatório de professor existente com os parâmetros permitidos.
  #
  # Parâmetros permitidos:
  #   - reports_professor_params: Parâmetros aceitos para atualizar o relatório de professor.
  #
  # Retorna:
  #   - HTML: Redireciona para a página do relatório atualizado com uma mensagem de sucesso.
  #   - JSON: Retorna o status de atualização e a localização do relatório.
  def update
    if @reports_professor.update(reports_professor_params)
      handle_success(:ok, @reports_professor, 'atualizado')
    else
      handle_failure(:edit)
    end
  end

  # DELETE /reports_professors/1 ou /reports_professors/1.json
  #
  # Deleta um relatório de professor existente.
  #
  # Retorna:
  #   - HTML: Redireciona para a página principal dos relatórios de professores com uma mensagem de sucesso.
  #   - JSON: Retorna nenhum conteúdo.
  def destroy
    @reports_professor.destroy!
    respond_to do |format|
      format.html { redirect_to reports_professors_url, notice: 'Relatório do professor foi deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #
    # Configura o relatório de professor antes de executar certas ações.
    def set_reports_professor
      @reports_professor = ReportsProfessor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #
    # Permite apenas uma lista de parâmetros confiáveis (strong parameters).
    def reports_professor_params
      params.require(:reports_professor).permit(:formulario_id)
    end

    # Handle successful save or update
    #
    # Manipula o sucesso ao salvar ou atualizar o relatório de professor.
    #
    # Parâmetros:
    #   - status: Status HTTP a ser retornado.
    #   - reports_professor: Objeto do relatório de professor salvo ou atualizado.
    #   - action: Ação realizada (criado/atualizado).
    #
    # Retorna:
    #   - HTML: Redireciona para a página do relatório com uma mensagem de sucesso.
    #   - JSON: Retorna o status de sucesso e a localização do relatório.
    def handle_success(status, reports_professor, action)
      respond_to do |format|
        format.html { redirect_to reports_professor_url(reports_professor), notice: "Relatório do professor foi #{action} com sucesso." }
        format.json { render :show, status: status, location: reports_professor }
      end
    end

    # Handle failure to save or update
    #
    # Manipula a falha ao salvar ou atualizar o relatório de professor.
    #
    # Parâmetros:
    #   - render_action: Ação de renderização a ser realizada em caso de falha.
    #
    # Retorna:
    #   - HTML: Renderiza a ação de renderização com status de entidade não processável.
    #   - JSON: Retorna os erros encontrados durante a tentativa de salvar ou atualizar.
    def handle_failure(render_action)
      respond_to do |format|
        format.html { render render_action, status: :unprocessable_entity }
        format.json { render json: @reports_professor.errors, status: :unprocessable_entity }
      end
    end
end

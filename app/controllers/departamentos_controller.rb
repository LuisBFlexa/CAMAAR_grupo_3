# Controller responsável por gerenciar departamentos na aplicação.
class DepartamentosController < ApplicationController
  # Antes de executar as ações show, edit, update e destroy, configura o departamento.
  before_action :set_departamento, only: %i[ show edit update destroy ]

  # GET /departamentos ou /departamentos.json
  def index
    # Obtém todos os departamentos existentes.
    @departamentos = Departamento.all
  end

  # GET /departamentos/1 ou /departamentos/1.json
  def show
    # Encontra o departamento pelo ID especificado.
    @departamento = Departamento.find(params[:id])
  end

  # GET /departamentos/new
  def new
    # Inicializa um novo objeto departamento.
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
    # Encontra o departamento pelo ID especificado para edição.
    @departamento = Departamento.find(params[:id])
  end

  # POST /departamentos ou /departamentos.json
  def create
    # Cria um novo departamento com os parâmetros permitidos.
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento foi criado com sucesso." }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1 ou /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1 ou /departamentos/1.json
  def destroy
    @departamento.destroy

    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: "Departamento foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para configurar ou impor restrições comuns entre as ações.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def departamento_params
      params.require(:departamento).permit(:nome)
    end
end

# Representa um relatório de aluno na aplicação.
class ReportsAluno < ApplicationRecord
    # Associação muitos-para-um com Formulario.
    belongs_to :formulario
  end
  
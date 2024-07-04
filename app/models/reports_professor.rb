# Representa um relatório de professor na aplicação.
class ReportsProfessor < ApplicationRecord
    # Associação muitos-para-um com Formulario.
    belongs_to :formulario
  end
  
# Representa um formulário na aplicação.
class Formulario < ApplicationRecord
    # Associação muitos-para-um com FormularioTemplate.
    belongs_to :formulario_template
  
    # Associação um-para-muitos com reports_alunos.
    has_many :reports_alunos
  
    # Associação um-para-muitos com reports_professors.
    has_many :reports_professors
  end
  
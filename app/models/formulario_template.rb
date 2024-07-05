# A classe FormularioTemplate representa um template de formulário na aplicação.
# Ela é uma subclasse de ApplicationRecord, utilizando funcionalidades de persistência fornecidas pelo ActiveRecord.
class FormularioTemplate < ApplicationRecord
    # Define a associação um-para-muitos com formulários.
    has_many :formularios
  end
  
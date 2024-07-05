# A classe Departamento representa um departamento dentro da aplicação.
# Ela é uma subclasse de ApplicationRecord, utilizando funcionalidades de persistência fornecidas pelo ActiveRecord.
class Departamento < ApplicationRecord
  # Valida a presença e unicidade do nome do departamento.
  validates :nome, uniqueness: true, presence: true

  # Define a associação um-para-muitos com professores.
  has_many :professors

  # Define a associação um-para-muitos com matérias.
  has_many :materias
end

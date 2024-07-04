# Representa um professor na aplicação.
class Professor < ApplicationRecord
  # Módulos do Devise para autenticação e funcionalidades relacionadas.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validações de presença para os atributos do professor.
  validates :email, :encrypted_password, :nome, presence: true
  validates :isadmin, inclusion: { in: [true, false] }
  validates :departamento_id, presence: true

  # Associação muitos-para-um com Departamento.
  belongs_to :departamento

  # Associação muitos-para-muitos com Materia.
  has_and_belongs_to_many :materia

  # Associação um-para-muitos com Formulario, com dependência destrutiva.
  has_many :formularios, dependent: :destroy
end

# A classe Aluno representa os alunos da aplicação.
# Esta classe inclui módulos do Devise para autenticação e validação.
# Também possui validações para garantir a presença e unicidade de certos atributos.
class Aluno < ApplicationRecord
  # Inclui os módulos do Devise para autenticação. 
  # Outros módulos disponíveis são:
  # :confirmable, :lockable, :timeoutable, :trackable e :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Valida a presença e unicidade do email.
  validates :email, presence: true, uniqueness: true

  # Valida a presença da senha criptografada.
  validates :encrypted_password, presence: true

  # Valida a presença do nome.
  validates :nome, presence: true

  # Valida a presença e unicidade da matrícula.
  validates :matricula, presence: true, uniqueness: true

  # Valida a presença do curso.
  validates :curso, presence: true

  # Estabelece uma associação muitos-para-muitos com a classe Materium.
  has_and_belongs_to_many :materium
end

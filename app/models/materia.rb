class Materia < ApplicationRecord
  class Materia::NotFoundError < StandardError; end
  class Materia::ConnectionTimeoutError < StandardError; end

  def self.get_sigaa_classes
    begin
      SIGAA::Client.fetch_classes
    rescue SIGAA::Client::ConnectionTimeoutError
      raise Materia::ConnectionTimeoutError, 'Erro ao conectar com o banco de dados. Tente novamente mais tarde.'
    rescue SIGAA::Client::NotFound
      raise Materia::NotFoundError, 'Não foi possível encontrar a turma solicitada.'
    end
  end

  validates :codigo, presence: true
  validates :nome, presence: true
  validates :semestre, presence: true
  validates :horario, presence: true
  validates :departamento_id, presence: true

  belongs_to :departamento
  has_and_belongs_to_many :aluno
  has_and_belongs_to_many :professor
end

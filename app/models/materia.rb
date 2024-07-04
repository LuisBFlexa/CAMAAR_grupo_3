# Representa uma disciplina na aplicação.
class Materia < ApplicationRecord
  # Exceção lançada quando uma disciplina não é encontrada.
  class NotFoundError < StandardError; end

  # Exceção lançada quando ocorre timeout na conexão com o banco de dados.
  class ConnectionTimeoutError < StandardError; end

  # Método de classe para obter classes do SIGAA.
  # Retorna classes do SIGAA ou lança exceções específicas.
  def self.get_sigaa_classes
    begin
      SIGAA::Client.fetch_classes
    rescue SIGAA::Client::ConnectionTimeoutError
      raise ConnectionTimeoutError, 'Erro ao conectar com o banco de dados. Tente novamente mais tarde.'
    rescue SIGAA::Client::NotFound
      raise NotFoundError, 'Não foi possível encontrar a turma solicitada.'
    end
  end

  # Validações de presença para os atributos da disciplina.
  validates :codigo, :nome, :semestre, :horario, :departamento_id, presence: true

  # Associação muitos-para-um com Departamento.
  belongs_to :departamento

  # Associações muitos-para-muitos com Aluno e Professor.
  has_and_belongs_to_many :aluno
  has_and_belongs_to_many :professor
end

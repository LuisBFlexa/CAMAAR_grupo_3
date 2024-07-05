require 'json'
require 'logger'

logger = Logger.new(STDOUT)

begin
  # Lê o conteúdo do arquivo JSON
  file = File.read('class_members.json')
  data_hash = JSON.parse(file)
rescue => e
  # Registra um erro se houver problemas ao ler ou parsear o arquivo JSON
  logger.error("Erro ao ler ou parsear o arquivo JSON: #{e.message}")
  exit
end

# Itera sobre cada entrada de informações de classes no arquivo JSON
data_hash.each do |class_info|
  # Processa os discentes (alunos) da classe
  class_info["discente"].each do |aluno|
    begin
      # Verifica se o aluno já existe pelo email
      existing_aluno = Aluno.find_by(email: aluno["email"])
      if existing_aluno
        logger.info("Aluno já existe: #{aluno["email"]}")
        next
      end

      # Gera uma senha aleatória
      password = Array.new(8) { [*'0'..'9', *'a'..'z', *'A'..'Z'].sample }.join

      # Cria o aluno no banco de dados
      Aluno.create!(
        nome: aluno["nome"],
        curso: aluno["curso"],
        matricula: aluno["matricula"],
        email: aluno["email"],
        password: password,
        password_confirmation: password
      )
      logger.info("Aluno criado: #{aluno["email"]}")

    rescue => e
      # Registra um erro se houver problemas ao criar o aluno
      logger.error("Erro ao criar aluno #{aluno["email"]}: #{e.message}")
    end
  end

  # Processa os docentes (professores) da classe
  class_info["docente"].each do |professor|
    begin
      # Verifica se o professor já existe pelo email
      existing_professor = Professor.find_by(email: professor["email"])
      if existing_professor
        logger.info("Professor já existe: #{professor["email"]}")
        next
      end

      # Gera uma senha aleatória
      password = Array.new(8) { [*'0'..'9', *'a'..'z', *'A'..'Z'].sample }.join

      # Obtém ou cria o departamento do professor
      departamento_nome = professor["departamento"]
      if departamento_nome.nil? || departamento_nome.strip.empty?
        logger.error("Professor #{professor["email"]} não tem departamento especificado.")
        next
      end
      departamento = Departamento.find_or_create_by(nome: departamento_nome)

      # Verifica se o professor é um administrador
      is_admin = professor["ocupacao"]&.downcase == "coordenador"

      # Cria o professor no banco de dados
      Professor.create!(
        nome: professor["nome"],
        email: professor["email"],
        password: password,
        password_confirmation: password,
        departamento: departamento,
        isadmin: is_admin
      )
      logger.info("Professor criado: #{professor["email"]} com isadmin: #{is_admin}")

    rescue => e
      # Registra um erro se houver problemas ao criar o professor
      logger.error("Erro ao criar professor #{professor["email"]}: #{e.message}")
    end
  end
end

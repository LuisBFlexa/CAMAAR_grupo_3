require 'json'

file = File.read('class_members.json')
data_hash = JSON.parse(file)

data_hash.each do |class_info|
  discente = class_info["dicente"]
  aluno = discente.is_a?(Array) ? discente.first : discente

  # Verifica se o aluno já existe antes de criar um novo
  existing_aluno = Aluno.find_by(email: aluno["email"])
  next if existing_aluno

  password = Array.new(8) { [*'0'..'9', *'a'..'z', *'A'..'Z'].sample }.join

  Aluno.create!(
    nome: aluno["nome"],
    curso: aluno["curso"],
    matricula: aluno["matricula"],
    email: aluno["email"],
    password: password,
    password_confirmation: password
  )

  professor = class_info["docente"]

  departamento = Departamento.find_or_create_by(nome: professor["departamento"])
  is_admin = professor["ocupacao"].casecmp("coordenador").zero?

  Professor.create!(
    nome: professor["nome"],
    departamento: departamento,
    email: professor["email"],
    password: Devise.friendly_token[0, 20], # Temporary password
    isadmin: is_admin
  )
end

# app/services/file_service.rb
class FileService
  # Lista os arquivos em um diretório com um padrão específico
  def self.list_files(path, pattern)
    Dir.glob("#{path}/#{pattern}").map { |file| File.basename(file) }
  end

  # Lê o conteúdo de um arquivo se ele existir
  def self.read_file(file_path)
    File.read(file_path) if File.exist?(file_path)
  end

  # Salva conteúdo em um arquivo especificado
  def self.save_file(path, file_name, content)
    File.open("#{path}/#{file_name}", 'w') { |file| file.write(content) }
  end

  # Exclui um arquivo se ele existir
  def self.delete_file(file_path)
    File.delete(file_path) if File.exist?(file_path)
  end
end

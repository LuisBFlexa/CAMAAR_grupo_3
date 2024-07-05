# app/services/formulario_service.rb
class FormularioService
  def self.sanitized_form_data(params)
    {
      name: sanitize(params[:form_name]),
      professor: sanitize(params[:professor]),
      semester: sanitize(params[:semester]),
      questions: params[:questions]
    }
  end

  def self.generate_safe_file_name(data)
    "#{data[:name]}-#{data[:professor]}-#{data[:semester]}.json"
  end

  def self.create_response_directory(folder_name)
    dir_path = Rails.root.join('public', 'respostas', folder_name)
    Dir.mkdir(dir_path) unless Dir.exist?(dir_path)
  end

  def self.delete_response_directory(file_name)
    folder_name = file_name.split('.json').first
    dir_path = Rails.root.join('public', 'respostas', folder_name)
    FileUtils.rm_rf(dir_path) if Dir.exist?(dir_path)
  end

  def self.fetch_response_files(form_name, question_key)
    base_path = Rails.root.join('public', 'respostas', form_name)
    search_pattern = "#{base_path}/*.json"
    files = Dir.glob(search_pattern)
    
    files.map do |file|
      if File.exist?(file)
        response_data = JSON.parse(File.read(file))
        { file: File.basename(file), response: response_data[question_key] } if response_data[question_key]
      end
    end.compact
  end

  private

  def self.sanitize(value)
    value.gsub(/[^0-9A-Za-z.\- ]/, '')
  end
end

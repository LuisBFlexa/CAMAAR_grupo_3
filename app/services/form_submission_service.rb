# app/services/form_submission_service.rb
class FormSubmissionService
  def self.fetch_form(file_name)
    file_path = Rails.root.join('public', 'formularios', file_name)
    return JSON.parse(File.read(file_path)) if File.exist?(file_path)
    nil
  end

  def self.save_submission(data)
    form_name = data['formName']
    professor = data['professor']
    semester = data['semester']
    file_name = data['fileName']
    directory = Rails.root.join('public', 'respostas', "#{form_name}-#{professor}-#{semester}")

    Dir.mkdir(directory) unless Dir.exist?(directory)
    file_path = directory.join(file_name)

    File.open(file_path, 'w') { |file| file.write(JSON.pretty_generate(data['data'])) }
    file_path.to_s
  rescue => e
    Rails.logger.error "Error saving file: #{e.message}"
    raise e
  end
end

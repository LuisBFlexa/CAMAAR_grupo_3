# Controller responsável por gerenciar os templates na aplicação.
class TemplatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /save_template
  #
  # Salva um template com os dados fornecidos no diretório de templates públicos.
  #
  # Parâmetros permitidos:
  #   - templateName: Nome do template a ser salvo.
  #   - questions: Array de perguntas do template, cada uma com um tipo e opcionalmente opções.
  #
  # Retorna:
  #   - Texto plano: Mensagem de sucesso se o template for salvo com sucesso.
  #   - Erro 500: Mensagem de erro se ocorrer algum problema durante o salvamento.
  def save_template
    template_data = params.require(:template).permit(:templateName, questions: [:type, { options: [] }])
    file_name = "#{template_data[:templateName]}.json"
    file_path = Rails.root.join('public', 'templates', file_name)

    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(template_data.to_h))
    end

    render plain: 'Template salvo com sucesso!'
  rescue => e
    logger.error "Erro ao salvar o template: #{e.message}"
    render plain: 'Erro ao salvar o template', status: :internal_server_error
  end

  # GET /check_name
  #
  # Verifica se um template com o nome fornecido já existe no banco de dados.
  #
  # Parâmetros:
  #   - name: Nome do template a ser verificado.
  #
  # Retorna:
  #   - JSON: Objeto contendo a chave 'exists' que indica se o template existe ou não no banco de dados.
  def check_name
    template_name = params[:name]
    template_exists = Template.exists?(name: template_name)
    render json: { exists: template_exists }
  end
end

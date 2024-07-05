# ApplicationRecord é a classe base para todos os models da aplicação.
# Ela estende ActiveRecord::Base, fornecendo funcionalidades básicas de persistência.
class ApplicationRecord < ActiveRecord::Base
  # Indica que ApplicationRecord é uma classe abstrata.
  self.abstract_class = true
end


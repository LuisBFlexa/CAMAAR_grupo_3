class AddNotNullConstraintsToProfessors < ActiveRecord::Migration[6.0]
  def change
    change_column_null :professors, :isadmin, false
    change_column_null :professors, :nome, false
  end
end


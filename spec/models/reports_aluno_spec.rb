require 'rails_helper'

RSpec.describe ReportsAluno, type: :model do
  describe 'validations' do
    context 'is valid with valid attributes' do
      it 'should be valid with valid attributes' do
        reports_aluno = build(:reports_aluno)
        expect(reports_aluno).to be_valid
      end
    end
   end
    describe 'associations' do
        it { should belong_to(:formularios) }
    end
end

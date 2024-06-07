require 'rails_helper'

RSpec.describe FormularioTemplate, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        formulario_template = build(:formulario_template)
        expect(formulario_template).to be_valid
      end
    end

    context 'without a nome' do
      it 'is invalid' do
        formulario_template = build(:formulario_template, nome: nil)
        expect(formulario_template).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it { should have_many(:formularios) }
  end
end


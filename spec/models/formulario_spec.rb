require 'rails_helper'

RSpec.describe Formulario, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        formulario = build(:formulario)
        expect(formulario).to be_valid
      end
    end

    context 'without a nome' do
      it 'is invalid' do
        formulario = build(:formulario, nome: nil)
        expect(formulario).not_to be_valid
      end
    end

    context 'without perguntas' do
        it 'is invalid' do
          formulario = build(:formulario, perguntas: nil)
          expect(formulario).not_to be_valid
        end
      end
  end

  describe 'associations' do
    it { should belong_to(:formulario_template) }
  end
end


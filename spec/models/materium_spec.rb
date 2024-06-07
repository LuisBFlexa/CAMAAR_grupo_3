require 'rails_helper'

RSpec.describe Materium, type: :model do
  describe 'validations' do

    context 'is valid with valid attributes' do
      it 'should be valid with valid attributes' do
        materium = build(:materium)
        expect(materium).to be_valid
      end
    end

    context 'is not valid without a nome' do
      it 'should be invalid without nome' do
        materium = build(:materium, nome: nil)
        expect(materium).not_to be_valid
      end
    end

    context 'is not valid without a codigo' do
      it 'should be invalid without codigo' do
        materium = build(:materium, codigo: nil)
        expect(materium).not_to be_valid
      end
    end

    context 'is not valid without an semestre' do
      it 'should be invalid without semestre' do
        materium = build(:materium, semestre: nil)
        expect(materium).not_to be_valid
      end
    end

    context 'is not valid without a horario' do
      it 'should be invalid without horario' do
        materium = build(:materium, horario: nil)
        expect(materium).not_to be_valid
      end
    end

    context 'is not valid with non-unique codigo' do
      it 'should be invalid with a duplicate codigo' do
        create(:materium, codigo: 'CIC0000')
        duplicate_materium = build(:materium, codigo: 'CIC0000')
        expect(duplicate_materium).not_to be_valid
      end
    end

    context 'is not valid with non-unique name' do
        it 'should be invalid with a duplicate name' do
          create(:materium, name: 'nome-teste')
          duplicate_materium = build(:materium, codigo: 'nome-teste')
          expect(duplicate_materium).not_to be_valid
        end
      end

  end

  describe 'associations' do
    it { should have_and_belong_to_many(:professors) }
    it { should have_and_belong_to_many(:alunos) }
    it { should belong_to(:departamentos) }  
  end

end

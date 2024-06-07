FactoryBot.define do
  factory :departamento do
    nome { Faker::Company.unique.industry }
    association :materium
    association :professor
  end
end

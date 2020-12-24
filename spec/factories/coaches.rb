FactoryBot.define do
  factory :coach do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    teach_style { 'バタフライ' }
  end
end

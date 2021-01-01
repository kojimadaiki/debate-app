FactoryBot.define do
  factory :debate do
    name {Faker::Name.initials(number: 2)}
  end
end

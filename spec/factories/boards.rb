FactoryBot.define do
  factory :board do
    title                  { "バタフライ講座" }
    start_time             { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end

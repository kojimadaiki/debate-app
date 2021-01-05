FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.sentence}
    association :user
    association :coach
    association :debate

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      message.video.attach(io: File.open('public/videos/dressel.MP4'), filename: 'dressel.MP4')
    end
  end
end

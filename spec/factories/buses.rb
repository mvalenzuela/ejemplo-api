FactoryBot.define do
  factory :bus do
    route { Faker::Lorem.word }
    arrival_estimation { Faker::Number.number(10) }
  end
end

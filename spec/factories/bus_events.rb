FactoryBot.define do
  factory :bus_event do
    plate_code { Faker::StarWars.character }
    done false
  end
end

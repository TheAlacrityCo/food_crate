FactoryBot.define do
  factory :food do
    name { Faker::Food.fruits }
    unit_type { "lbs" }
    amount { Faker::Measurement.weight }
    expiration { Faker::Date.between(from: 200.days.ago, to: Date.today) }
    association :farm
  end
end

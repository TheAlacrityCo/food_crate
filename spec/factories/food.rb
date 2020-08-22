FactoryBot.define do
  factory :food do
    name { Faker::Food.fruits }
    unit_type { "lbs" }
    amount { rand(1..100) }
    expiration { Faker::Date.between(from: 200.days.ago, to: Date.today) }
    association :supplier
  end
end

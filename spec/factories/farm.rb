FactoryBot.define do
  factory :farm do
    name { Faker::Company.name + "Farm" }
    state { Faker::Address.state }
    country { "United States" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    need_level { rand(2) }
  end
end

FactoryBot.define do
  factory :logistics_company do
    name { Faker::Company.name }
    state { Faker::Address.state }
    country { "United States" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    max_load { rand(10..2000) }
    association :user
  end
end

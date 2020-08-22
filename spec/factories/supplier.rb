FactoryBot.define do
  factory :supplier do
    name { Faker::Company.name }
    state { Faker::Address.state }
    country { "United States" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    supplier_type { rand(4) }
    association :user
  end
end

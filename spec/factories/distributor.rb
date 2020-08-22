FactoryBot.define do
  factory :distributor do
    name { Faker::Company.name }
    state { Faker::Address.state }
    country { "United States" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    need_level { rand(2) }
    capacity { rand(100) }
    distributor_type { rand(5) }
    association :user
  end
end

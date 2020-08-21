FactoryBot.define do
  factory :food_bank do
    name { Faker::Color.color_name.capitalize + "Bank" }
    state { Faker::Address.state }
    country { "United States" }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.phone_number }
    need_level { rand(2) }
    capacity { rand(100) }
  end
end

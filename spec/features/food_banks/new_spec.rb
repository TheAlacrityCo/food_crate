require 'rails_helper'

RSpec.describe 'Food Banks New: ' do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'can create' do
    visit food_banks_list_path
    click_link "Add a Food Bank"

    expect(current_path).to eq('/food_banks/new')
    expect(page).to have_content(@user.email)

    food_bank = {
      name: "Test Bank",
      state: "Oregon",
      country: "United States",
      address: "419 Test Drive",
      phone: "123-456-7890",
      need_level: "high",
      capacity: '50'
    }

    fill_in 'food_bank[name]', with: food_bank[:name]
    fill_in 'food_bank[state]', with: food_bank[:state]
    choose 'food_bank_country_united_states'
    fill_in 'food_bank[address]', with: food_bank[:address]
    fill_in 'food_bank[phone]', with: food_bank[:phone]
    choose 'food_bank_need_level_high'
    fill_in 'food_bank[capacity]', with: food_bank[:capacity]

    click_on 'Create Food Bank'

    expect(current_path).to eq('/food_banks')

    within('.food-banks') do
        expect(page).to have_content(food_bank[:name])
        expect(page).to have_content(food_bank[:state])
        expect(page).to have_content(food_bank[:country])
        expect(page).to have_content(food_bank[:address])
        expect(page).to have_content(food_bank[:phone])
        expect(page).to have_content(food_bank[:need_level])
        expect(page).to have_content(food_bank[:capacity])
    end
  end
end

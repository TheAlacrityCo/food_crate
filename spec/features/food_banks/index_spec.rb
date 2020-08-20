require 'rails_helper'

RSpec.describe 'Food Banks Index' do
  before :each do
    employee = create(:user)
    @food_bank = create(:food_bank, user: employee)
  end

  it 'can show information for banks' do
    visit food_banks_list_path

    within('.food-banks') do
        expect(page).to have_content(@food_bank.name)
        expect(page).to have_content(@food_bank.state)
        expect(page).to have_content(@food_bank.country)
        expect(page).to have_content(@food_bank.address)
        expect(page).to have_content(@food_bank.phone)
        expect(page).to have_content(%i[low medium high][@food_bank.need_level].to_s)
        expect(page).to have_content(@food_bank.capacity)
    end
  end
end

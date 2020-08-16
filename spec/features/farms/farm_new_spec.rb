require 'rails_helper'

RSpec.describe 'Create a new Farm resource as a user' do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'There is a form on the new Farm view to create a farm resource' do
    visit root_path

    expect(page).to have_link('Add a Farm')
    click_on 'Add a Farm'

    expect(current_path).to eq('/farms/new')
    expect(page).to have_content(@user.email)

    fill_in 'farm[name]', with: 'The Garden Patch'
    fill_in 'farm[state]', with: 'Maine'
    fill_in 'farm[country]', with: 'US'
    fill_in 'farm[address]', with: '321 Veggie Drive'
    fill_in 'farm[phone]', with: '321-654-0987'
    choose 'farm_need_level_low'

    click_on 'Create Farm'

    expect(current_path).to eq('/farms')
  end
end

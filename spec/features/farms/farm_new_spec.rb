require 'rails_helper'

RSpec.describe 'Create a Farm' do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'can be successfully created' do
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

    farm = Farm.last
    expect(page).to have_content(farm.name)
    expect(page).to have_content(farm.country)
    expect(page).to have_content(farm.state)
    expect(page).to have_content(farm.address)
    expect(page).to have_content(farm.phone)
  end

  it 'can gracefully handle unsuccessful creation' do
    visit root_path

    expect(page).to have_link('Add a Farm')
    click_on 'Add a Farm'

    expect(current_path).to eq('/farms/new')
    expect(page).to have_content(@user.email)

    fill_in 'farm[name]', with: 'The Garden Patch'
    fill_in 'farm[state]', with: 'Maine'
    fill_in 'farm[country]', with: 'US'
    fill_in 'farm[address]', with: '321 Veggie Drive'

    click_on 'Create Farm'

    expect(current_path).to eq('/farms/new')

    expect(page).to have_content("Phone can't be blank")
    expect(page).to have_content("Need level can't be blank")
  end
end

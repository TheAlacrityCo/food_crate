require 'rails_helper'

RSpec.describe 'Create a new Farm resource as a user' do
  before :each do
    @user = create(:user)
    @user.confirm
    sign_in @user

    @farm1 = @user.farm.create!(
      name: 'Plant Farm',
      state: 'Colorado',
      country: 'US',
      address: '123 Cool Farm Rd',
      phone: '123-456-7890',
      need_level: 1
    )
  end

  it 'There is a form on the new Farm view to create a farm resource' do
    visit root

    expect(page).to have_link('Add a Farm')
    click 'Add a farm'

    expect(current_path).to eq('/farms/new')

    expect(page).to have_field('Name')
    expect(page).to have_field('State')
    expect(page).to have_field('Country')
    expect(page).to have_field('Address')
    expect(page).to have_field('Phone')
    expect(page).to have_field('Need Level')

    fill_in :name, with: 'The Garden Patch'
    fill_in :state, with: 'Maine'
    fill_in :country, with: 'US'
    fill_in :address, with: '321 Veggie Drive'
    fill_in :phone, with: '321-654-0987'
    fill_in :need_level, with: 1

    click 'Create Farm'
  end
end

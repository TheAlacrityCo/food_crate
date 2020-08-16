require 'rails_helper'

RSpec.describe 'Create a new Farm resource as a user' do
  before :each do
    @user = create(:user)
    # sign_in @user

    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.encrypted_password
    click_on 'Log in'

  end

  xit 'There is a form on the new Farm view to create a farm resource' do
    visit root_path

    expect(page).to have_link('Add a Farm')
    click_on 'Add a Farm'

    expect(current_path).to eq('/farms/new')

    fill_in :name, with: 'The Garden Patch'
    fill_in :state, with: 'Maine'
    fill_in :country, with: 'US'
    fill_in :address, with: '321 Veggie Drive'
    fill_in :phone, with: '321-654-0987'
    fill_in :need_level, with: 1

    click 'Create Farm'
  end
end

require 'rails_helper'

RSpec.describe 'Create a Logistics Company' do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'can be successfully created' do
    visit root_path

    click_on 'Logistics'

    expect(current_path).to eq('/logistics')
    expect(page).to have_link('Add a Logistics Company')

    click_on 'Add a Logistics Company'

    expect(current_path).to eq('/logistics_companies/new')
    expect(page).to have_content(@user.email)

    fill_in 'logistics_company[name]', with: 'The Garden Patch'
    fill_in 'logistics_company[state]', with: 'Maine'
    choose 'logistics_company_country_united_states'
    fill_in 'logistics_company[address]', with: '321 Veggie Drive'
    fill_in 'logistics_company[phone]', with: '321-654-0987'
    fill_in 'logistics_company[max_load]', with: 7

    click_on 'Create Logistics company'

    expect(current_path).to eq('/logistics')

    logistics_company = LogisticsCompany.last
    expect(page).to have_link(logistics_company.name)
    expect(page).to have_content(logistics_company.country)
    expect(page).to have_content(logistics_company.state)
    expect(page).to have_content(logistics_company.address)
    expect(page).to have_content(logistics_company.phone)

    click_on logistics_company.name

    expect(current_path).to eq(logistics_show_path(logistics_company))
    expect(page).to have_content(logistics_company.name)
    expect(page).to have_content(logistics_company.country)
    expect(page).to have_content(logistics_company.state)
    expect(page).to have_content(logistics_company.address)
    expect(page).to have_content(logistics_company.phone)
    expect(page).to have_link("Logistics Companies")
  end

  it 'can gracefully handle unsuccessful creation' do
    visit logistics_list_path

    click_on 'Add a Logistics Company'

    expect(current_path).to eq('/logistics_companies/new')
    expect(page).to have_content(@user.email)

    fill_in 'logistics_company[name]', with: 'The Garden Patch'
    fill_in 'logistics_company[state]', with: 'Maine'
    choose 'logistics_company_country_united_states'
    fill_in 'logistics_company[address]', with: '321 Veggie Drive'

    click_on 'Create Logistics company'

    expect(current_path).to eq('/logistics_companies/new')

    expect(page).to have_content("Phone can't be blank")
    expect(page).to have_content("Max load can't be blank")
  end

  it 'can only be created by registered users' do
    visit new_logistics_company_path

    expect(page).to have_field('logistics_company[name]')
    expect(page).to have_field('logistics_company[country]')
    expect(page).to have_field('logistics_company[state]')
    expect(page).to have_field('logistics_company[address]')
    expect(page).to have_field('logistics_company[phone]')

    sign_out @user

    visit new_logistics_company_path

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content('Log in')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end
end

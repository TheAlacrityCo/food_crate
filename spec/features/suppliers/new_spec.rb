require 'rails_helper'

RSpec.describe 'Create a Supplier' do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  it 'can be successfully created' do
    visit root_path

    click_on 'Suppliers'

    expect(current_path).to eq('/suppliers')
    expect(page).to have_link('Add a Supplier')

    click_on 'Add a Supplier'

    expect(current_path).to eq('/suppliers/new')
    expect(page).to have_content(@user.email)

    fill_in 'supplier[name]', with: 'The Garden Patch'
    fill_in 'supplier[state]', with: 'Maine'
    choose 'supplier_country_united_states'
    fill_in 'supplier[address]', with: '321 Veggie Drive'
    fill_in 'supplier[phone]', with: '321-654-0987'
    select 'Farm', from: 'supplier[supplier_type]'

    click_on 'Create Supplier'

    expect(current_path).to eq('/suppliers')

    supplier = Supplier.last
    expect(page).to have_content(supplier.name)
    expect(page).to have_content(supplier.country)
    expect(page).to have_content(supplier.state)
    expect(page).to have_content(supplier.address)
    expect(page).to have_content(supplier.phone)
    expect(page).to have_content(supplier.type_display)
  end

  it 'can gracefully handle unsuccessful creation' do
    visit suppliers_list_path

    expect(page).to have_link('Add a Supplier')
    click_on 'Add a Supplier'

    expect(current_path).to eq('/suppliers/new')
    expect(page).to have_content(@user.email)

    fill_in 'supplier[name]', with: 'The Garden Patch'
    fill_in 'supplier[state]', with: 'Maine'
    choose 'supplier_country_united_states'
    fill_in 'supplier[address]', with: '321 Veggie Drive'
    select 'Farm', from: 'supplier[supplier_type]'

    click_on 'Create Supplier'

    expect(current_path).to eq('/suppliers/new')

    expect(page).to have_content("Phone can't be blank")
  end

  it 'can only be created by registered users' do
    visit new_supplier_path

    expect(page).to have_field('supplier[name]')
    expect(page).to have_field('supplier[country]')
    expect(page).to have_field('supplier[state]')
    expect(page).to have_field('supplier[address]')
    expect(page).to have_field('supplier[phone]')

    sign_out @user

    visit new_supplier_path

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content('Log in')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end
end

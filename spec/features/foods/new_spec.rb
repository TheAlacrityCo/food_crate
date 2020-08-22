require 'rails_helper'

RSpec.describe 'Create a Food' do
  before :each do
    @user = create(:user)
    sign_in @user

    @supplier = create(:supplier, user: @user)
  end

  it 'can be successfully created' do
    visit root_path

    click_on 'Suppliers'

    expect(current_path).to eq('/suppliers')

    click_on @supplier.name

    expect(current_path).to eq(supplier_show_path(@supplier))
    expect(page).to have_content(@supplier.name)
    expect(page).to have_content(@supplier.state)
    expect(page).to have_content(@supplier.country)
    expect(page).to have_content(@supplier.phone)
    expect(page).to have_content(@supplier.address)
    expect(page).to have_content(@supplier.type_display)
    expect(page).to have_link('Add Food')

    click_on 'Add Food'

    expect(current_path).to eq("/suppliers/#{@supplier.id}/foods/new")

    fill_in 'food[name]', with: 'Peaches'
    choose 'food_unit_type_lbs'
    fill_in 'food[amount]', with: 25
    fill_in 'food[expiration]', with: Date.new(2021, 8, 22)

    click_on 'Create Food'

    expect(current_path).to eq("/suppliers/#{@supplier.id}")

    food = @supplier.foods.last

    expect(page).to have_content('Peaches')
    expect(page).to have_content(food.amount)
    expect(page).to have_content(food.unit_type)
    expect(page).to have_content(food.display)
  end

  it 'can gracefully handle unsuccessful creation' do
    visit root_path

    click_on 'Suppliers'

    expect(current_path).to eq('/suppliers')

    click_on @supplier.name

    expect(current_path).to eq(supplier_show_path(@supplier))
    expect(page).to have_content(@supplier.name)
    expect(page).to have_content(@supplier.state)
    expect(page).to have_content(@supplier.country)
    expect(page).to have_content(@supplier.phone)
    expect(page).to have_content(@supplier.address)
    expect(page).to have_content(@supplier.type_display)
    expect(page).to have_link('Add Food')

    click_on 'Add Food'

    expect(current_path).to eq("/suppliers/#{@supplier.id}/foods/new")

    fill_in 'food[name]', with: 'Peaches'
    choose 'food_unit_type_lbs'
    fill_in 'food[amount]', with: 25

    click_on 'Create Food'

    expect(current_path).to eq("/suppliers/#{@supplier.id}/foods/new")

    expect(page).to have_content("Expiration can't be blank")
  end

  it 'can only be created by registered users' do
    visit "/suppliers/#{@supplier.id}/foods/new"

    expect(page).to have_field('food[name]')
    expect(page).to have_field('food[amount]')
    expect(page).to have_field('food[expiration]')
    expect(page).to have_field('food[unit_type]')

    sign_out @user

    visit "/suppliers/#{@supplier.id}/foods/new"

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content('Log in')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end
end

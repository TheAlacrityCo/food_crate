require 'rails_helper'

RSpec.describe 'Distributors New:' do
  describe 'User' do
    before :each do
      @user = create(:user)
      sign_in @user

      visit distributors_list_path

      click_link "Add a Distributor"

      expect(current_path).to eq('/distributors/new')
      expect(page).to have_content(@user.email)
    end

    it 'can add a new distributor' do
      distributor = {
        name: "Test Bank",
        state: "Oregon",
        country: "United States",
        address: "419 Test Drive",
        phone: "123-456-7890",
        need_level: "high",
        capacity: '50',
        distributor_type: 0
      }

      fill_in 'distributor[name]', with: distributor[:name]
      fill_in 'distributor[state]', with: distributor[:state]
      choose 'distributor_country_united_states'
      fill_in 'distributor[address]', with: distributor[:address]
      fill_in 'distributor[phone]', with: distributor[:phone]
      choose 'distributor_need_level_high'
      select 'Food Bank', from: 'distributor[distributor_type]'
      fill_in 'distributor[capacity]', with: distributor[:capacity]

      click_on 'Create Distributor'

      expect(current_path).to eq('/distributors')

      within('.distributors') do
        expect(page).to have_content(distributor[:name])
        expect(page).to have_content(distributor[:state])
        expect(page).to have_content(distributor[:country])
        expect(page).to have_content(distributor[:address])
        expect(page).to have_content(distributor[:phone])
        expect(page).to have_content(distributor[:need_level])
        expect(page).to have_content(distributor[:capacity])
      end

      distributor = Distributor.last
      expect(page).to have_link(distributor.name)
      expect(page).to have_content(distributor.country)
      expect(page).to have_content(distributor.state)
      expect(page).to have_content(distributor.address)
      expect(page).to have_content(distributor.phone)
      expect(page).to have_content(distributor.need_level)
      expect(page).to have_content(distributor.type_display)

      click_on distributor.name

      expect(current_path).to eq(distributor_show_path(distributor))
      expect(page).to have_content(distributor.name)
      expect(page).to have_content(distributor.country)
      expect(page).to have_content(distributor.state)
      expect(page).to have_content(distributor.address)
      expect(page).to have_content(distributor.phone)
      expect(page).to have_content(distributor.need_level)
      expect(page).to have_content(distributor.type_display)
      expect(page).to have_link("Distributors")
    end

    it 'cannot add new distributor with missing credentials' do
      fill_in 'distributor[name]', with: 'Test'
      fill_in 'distributor[state]', with: 'Test'
      choose 'distributor_country_united_states'
      fill_in 'distributor[address]', with: 'Test'
      fill_in 'distributor[capacity]', with: '1'

      click_on 'Create Distributor'

      expect(current_path).to eq('/distributors/new')

      expect(page).to have_content("Phone can't be blank and Need level can't be blank")
    end
  end

  describe 'Visitor' do
    it 'cannot add a new distributor' do
      visit distributors_list_path
      click_link "Add a Distributor"

      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(page).not_to have_button('Create Distributor')

    end
  end
end

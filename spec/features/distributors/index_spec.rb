require 'rails_helper'

RSpec.describe 'Food Banks Index' do
  before :each do
    employee = create(:user)
    @distributor = create(:distributor, user: employee)
  end

  it 'can show information for banks' do
    visit distributors_list_path

    within('.distributors') do
      expect(page).to have_content(@distributor.name)
      expect(page).to have_content(@distributor.state)
      expect(page).to have_content(@distributor.country)
      expect(page).to have_content(@distributor.address)
      expect(page).to have_content(@distributor.phone)
      expect(page).to have_content(@distributor.need_level)
      expect(page).to have_content(@distributor.capacity)
      expect(page).to have_content(@distributor.type_display)
    end
  end
end

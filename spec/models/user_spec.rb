require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }
  end

  describe 'relationships' do
    it { should have_many :farms }
    it { should have_many :food_banks }
    it { should have_many :logistics_companies }
  end
end

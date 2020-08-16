require 'rails_helper'

RSpec.describe FoodBank, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
    it { should validate_presence_of :country }
    it { should validate_presence_of :address }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :need_level }
    it { should validate_presence_of :capacity }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end

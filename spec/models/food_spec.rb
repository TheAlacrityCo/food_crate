require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :amount }
    it { should validate_presence_of :unit_type }
    it { should validate_presence_of :expiration }
  end

  describe 'relationships' do
    it { should belong_to :supplier }
  end

  describe 'model instance methods' do
    before :each do
      @food = create(:food, expiration: Date.new(2021, 8, 22))
    end

    it 'display' do
      expect(@food.display).to eq("August 22nd, 2021")
    end
  end
end

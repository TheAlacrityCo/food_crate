require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
    it { should validate_presence_of :country }
    it { should validate_presence_of :address }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :supplier_type }
  end

  describe 'relationships' do
    it { should have_many :foods }
    it { should belong_to :user }
  end

  describe 'class instance methods' do
    before :each do
      @supplier = create(:supplier, supplier_type: :grocery_store)
    end

    it 'type_display' do
      expect(@supplier.type_display).to eq('Grocery Store')
    end
  end
end

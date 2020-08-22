require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }
  end

  describe 'relationships' do
    it { should have_many :suppliers }
    it { should have_many :distributors }
    it { should have_many :logistics_companies }
  end
end

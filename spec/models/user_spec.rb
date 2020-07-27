require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :encrypted_password }
  end

  describe 'relationships' do
    it { should belong_to :employable }
  end
end

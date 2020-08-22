class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :supplier_type, presence: true

  enum supplier_type: %i[
    farm
    grocery_store
    restaurant
    produce_distributor
    other
  ]

  has_many :foods
  belongs_to :user

  def type_display
    display = {
      'farm' => 'Farm',
      'grocery_store' => 'Grocery Store',
      'restaurant' => 'Restaurant',
      'produce_distributor' => 'Produce Distributor',
      'other' => 'Other'
    }

    display[supplier_type]
  end
end

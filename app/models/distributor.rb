class Distributor < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :need_level, presence: true
  validates :distributor_type, presence: true
  validates :capacity, numericality: { only_integer: true }, presence: true

  enum need_level: %i[
    low
    medium
    high
  ]

  enum distributor_type: %i[
    food_bank
    community_center
    school
    food_delivery
    religious_center
    other
  ]

  belongs_to :user

  def type_display
    display = {
      'food_bank' => 'Food Bank',
      'community_center' => 'Community Center',
      'school' => 'School',
      'food_delivery' => 'Food Delivery',
      'religious_center' => 'Religious Center',
      'other' => 'Other'
    }

    display[distributor_type]
  end
end

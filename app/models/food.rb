class Food < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: true }, presence: true
  validates :unit_type, presence: true
  validates :expiration, presence: true

  belongs_to :farm
end

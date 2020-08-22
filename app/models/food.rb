class Food < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: true }, presence: true
  validates :unit_type, presence: true
  validates :expiration, presence: true

  belongs_to :supplier

  def display
    expiration.to_formatted_s(:long_ordinal).delete_suffix("00:00").strip
  end
end

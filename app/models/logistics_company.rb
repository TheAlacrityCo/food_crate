class LogisticsCompany < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :max_load, numericality: { only_integer: true }, presence: true

  has_many :users, as: :employable
end

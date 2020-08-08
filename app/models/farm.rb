class Farm < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :need_level, presence: true

  enum need_level: %i[low medium high]

  has_many :foods
  belongs_to :companies, polymorphic: true
end

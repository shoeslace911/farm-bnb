class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :price, presence: true
  validates :species, presence: true
  validates :name, uniqueness: true, presence: true
end

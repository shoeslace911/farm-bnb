class Animal < ApplicationRecord

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :price, presence: true
  validates :species, presence: true
  validates :name, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

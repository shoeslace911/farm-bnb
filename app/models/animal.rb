class Animal < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
  validates :species, presence: true
  validates :name, uniqueness: true, presence: true
end

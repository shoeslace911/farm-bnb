class User < ApplicationRecord
  has_many :bookings # as client
  has_many :owned_animals, class_name: 'Animal' # as owner
  has_many :rented_animals, through: :bookings, source: :animal
   # rented animals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, presence: true

end

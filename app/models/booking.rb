class Booking < ApplicationRecord
  enum status: [:accepted, :rejected, :pending]
  belongs_to :user # renter
  belongs_to :animal

  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :renter_is_not_owner

  def number_of_days
    (end_date - start_date).to_i
  end

  def price
    animal.price * number_of_days
  end

  private

  def renter_is_not_owner
    if user == animal.user
      errors.add(:user, 'can not be the owner.')
    end
  end


end

class Booking < ApplicationRecord
  enum status: [:accepted, :rejected, :pending]
  belongs_to :user
  belongs_to :animal

  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


end

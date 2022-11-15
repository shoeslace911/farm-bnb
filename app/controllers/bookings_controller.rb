class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def create

  end

  def edit

  end

  def update

  end

private

end

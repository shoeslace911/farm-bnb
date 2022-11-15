class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def create

    authorize @booking
  end

  def edit

  end

  def update

  end

private

def policy_scope

end
end

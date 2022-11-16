class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @bookings = policy_scope(Booking)
    @bookings = Booking.new(booking_params)
    @booking. =
    if @bookings.save
      redirect_to bookings_path(current_user)
    else

    end
  end

  def edit

  end

  def update

  end

private

def booking_params
  params.require(Booking).permit( :start_date, :end_date )
end

end

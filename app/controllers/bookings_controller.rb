class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def new

  end

  # def create

  # @booking = Booking.new(booking_params)
  # @booking.animal = @animal
  # if @booking.save
  #   redirect_to
  # else
  #   render :new, status: :unprocessible_entity
  # end
  # end

  def edit

  end

  def update

  end

# def booking_params
#   params.require(:booking).permit(:)
# end

end

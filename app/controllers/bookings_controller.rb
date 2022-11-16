class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.animal = @animal
    @booking.user = current_user
    @booking.status = 2
    if @booking.save
      redirect_to bookings_path
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

private

def booking_params
  params.require(:booking).permit( :start_date, :end_date )
end

end

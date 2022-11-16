class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    @booking.status = 2
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  def update
  end

<<<<<<< HEAD

=======
>>>>>>> ceecd8246077ed59a0535ca94fee3cd80b7542b1
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end

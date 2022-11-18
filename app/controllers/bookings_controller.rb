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
    @booking.price = price_sum(@booking.start_date, @booking.end_date).to_i
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path(@booking)
    else
      render "index", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :name)
  end
  
  def price_sum(start_date, end_date)
    days = (end_date - start_date)
    days * @animal.price
  end
end

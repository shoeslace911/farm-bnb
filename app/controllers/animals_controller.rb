class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal)
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { animal: animal })
      }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @booking = Booking.new
    authorize @animal
    @markers = [@animal.geocode.first, @animal.geocode.last]
  end

  def new

  end

  def create

  end
end

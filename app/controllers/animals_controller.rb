class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal)
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude
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

class AnimalsController < ApplicationController
  def index
  @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @booking = Booking.new
    authorize @animal
  end

  def new

  end

  def create

  end
end

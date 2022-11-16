class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @animals = policy_scope(Animal)
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

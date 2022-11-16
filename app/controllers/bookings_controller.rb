class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

private

# def policy_scope

# end
end

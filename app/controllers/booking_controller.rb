class BookingController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to listings_path
  end

  def destroy
    @booking = Booking.find(paramsp[:id])
    @booking.destroy
    redirect_to listings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user.id, :listing.id)
  end
end

class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @user = current_user
  end

   def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR category ILIKE :query"
      @listings = policy_scope(Listing).where(sql_query, query: "%#{params[:query]}%")
    else
      @listings = policy_scope(Listing)
    end
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end
  end

  def show
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end
    authorize @listing
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to listings_path(@listing)
    else
      render :edit
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :picture, :availability, :location, :price, :photo)
  end

  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end
end

class ListingsController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR category ILIKE :query"
      @listings = Listing.where(sql_query, query: "%#{params[:query]}%")
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listings_path
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to listings_path(@listing)
    else
      render :edit
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :picture, :availability, :location, :price)
  end

end


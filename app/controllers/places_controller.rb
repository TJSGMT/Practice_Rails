class PlacesController < ApplicationController
  before_action :find_place ,only:[:edit, :show,:update,:destroy]
  
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    2.times {@place.addresses.build}
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @place.update_attributes(place_params)
      redirect_to root_path
    else
        render :edit
    end
  end
  
  def destroy
  end

  private
  def find_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title, addresses_attributes: [:id, :city, :street, :_destroy])
  end
end

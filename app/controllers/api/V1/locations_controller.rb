class Api::V1::LocationsController < ApplicationController

  def index
    locations = Location.all
    render json: locations
  end

  def create
    location = Location.create(location_params)
    search = Search.find(params[:search_id])
    search.locations << location
  end

  private

  def location_params
    params.require(:location).permit(:address, :search_id)
  end

end

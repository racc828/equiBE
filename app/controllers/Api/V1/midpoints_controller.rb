class Api::V1::MidpointsController < ApplicationController


  def index
    midpoints = Midpoint.all
    render json: midpoints
  end

  def create
    midpoint = Midpoint.create(midpoint_params)
    midpointJson = {
      latitude: midpoint.latitude,
      longitude: midpoint.longitude
    }
    render json: midpointJson
  end

  private

  def midpoint_params
    params.require(:midpoint).permit(:latitude, :longitude, :search_id)
  end

end

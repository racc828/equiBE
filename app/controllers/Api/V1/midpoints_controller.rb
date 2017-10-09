class Api::V1::MidpointsController < ApplicationController

  # Only create midpoints
  def index
    midpoints = Midpoint.all
    render json: midpoints
  end

  def create
    midpoint = Midpoint.create(midpoint_params)
    render json: midpoint
  end

  private

  def midpoint_params
    params.require(:midpoint).permit(:latitude, :longitude)
  end

end

class Api::V1::MidpointsController < ApplicationController


  def index
    midpoints = Midpoint.all
    render json: midpoints
  end

  def create

  end

  private

  def midpoint_params
    params.require(:midpoint).permit(:latitude, :longitude, :search_id)
  end

end

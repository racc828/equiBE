class Api::V1::VenuesController < ApplicationController


  def index
    venues = current_user.venues
    render json: venues
  end

  def create
    venue = Venue.create(venue_params)
    current_user.venues << venue
    render json: venue
  end

  private

  def venue_params
    params.require(:venue).permit(:user_id, :name, :vicinity)
  end

end

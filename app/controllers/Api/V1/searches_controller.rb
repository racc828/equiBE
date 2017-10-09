class Api::V1::SearchesController < ApplicationController

  def index
    searches = Search.all
    render json: searches
  end

  def create
    search = Search.create
    locationsArray = [params[:address1], params[:address2], params[:address3]]
    locationsArray.map {|location|
      Location.create("address": location, "search_id": search.id)
    }
    locations = search.locations
    render json: locations
  end

  private

  def search_params
    params.require(:search).permit(:address1, :address2)
  end

end

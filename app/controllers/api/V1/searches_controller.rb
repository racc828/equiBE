class Api::V1::SearchesController < ApplicationController

  def index
    searches = Search.all
    render json: searches
  end

  def create
    search = Search.create(search_params)
    locationsArray = [params[:address1], params[:address2], params[:address3]]
    if !params[:address3].empty?
      search.address3 = params[:address3]
    end
    newlocationsArray = locationsArray.map {|location|
      Location.create("address": location, "search_id": search.id) unless location.empty?
    }
    midpoint = Midpoint.calculate(newlocationsArray.compact, search.id)
    convertMidpointToAddress = Conversion.create("latitude": midpoint.latitude, "longitude": midpoint.longitude)
    search.midpoint = midpoint
    if current_user.present?
      search.user_id = current_user.id
      current_user.searches << search
    end
    searchesJson = {
      id:search.id,
      locations: search.locations,
      midpoint: search.midpoint,
      midpointAddress: convertMidpointToAddress.address
    }
    render json: searchesJson
  end


  def get_user_searches
    userSearches = current_user.searches
    render json: userSearches
  end

  private

     def search_params
        params.require(:search).permit(:address1, :address2)
      end


end

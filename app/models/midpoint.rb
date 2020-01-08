class Midpoint < ApplicationRecord
  # NOTE Midpoint objects are stored to the midpoint table as a way of reducing the number of Google API calls


  def self.calculate(locations, searchId)
    byebug
    #NOTE takes in an array of coordinates
    coords = Geocoder::Calculations.geographic_center(locations)
    self.create(latitude: coords[0], longitude: coords[1], search_id: searchId)
  end

end

class Midpoint < ApplicationRecord
  # NOTE Midpoint objects are stored to the midpoint table as a way of reducing the number of Google API calls


  def self.calculate(locations, searchId)
    # takes in an array of Location objects and returns a Midpoint object with the latitude and longitude of the geographic center/midpoint

    coords = Geocoder::Calculations.geographic_center(locations)
    self.create(latitude: coords[0], longitude: coords[1], search_id: searchId)
  end

end

class Location < ApplicationRecord
  belongs_to :search
  geocoded_by :address
  after_validation :geocode
end

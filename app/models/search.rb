class Search < ApplicationRecord
  has_many :locations
  has_one :midpoint
end

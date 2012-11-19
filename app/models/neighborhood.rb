class Neighborhood < ActiveRecord::Base
  belongs_to :city
  attr_accessible :name, :city_id
end

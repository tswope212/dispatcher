class City < ActiveRecord::Base
  has_many :streets
  attr_accessible :name
end

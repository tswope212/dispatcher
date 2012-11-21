class Street < ActiveRecord::Base
  belongs_to :city
  has_many :addresses
  attr_accessible :name, :city_id
end

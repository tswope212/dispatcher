class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :addresses
  has_many :units, :through => :addresses
  has_many :tasks, :through => :units
  attr_accessible :name, :city_id
  scope :alphabetical, :order => :name
end

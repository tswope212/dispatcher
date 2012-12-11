class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :addresses, :dependent => :nullify
  has_many :units, :through => :addresses
  has_many :jobs, :through => :units
  attr_accessible :name, :city_id
  scope :alphabetical, :order => :name
end

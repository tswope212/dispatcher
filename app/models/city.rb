class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :streets
  has_many :addresses, :through => :streets
  has_many :units, :through => :addresses
  has_many :tasks, :through => :units
  attr_accessible :name
  scope :alphabetical, :order => :name
end

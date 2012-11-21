class City < ActiveRecord::Base
  has_many :streets
  has_many :addresses, :through => :streets
  has_many :units, :through => :addresses
  has_many :tasks, :through => :units
  attr_accessible :name
end

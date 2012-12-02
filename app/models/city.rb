class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :streets
  has_many :addresses, :through => :streets
  has_many :units, :through => :addresses
  has_many :tasks, :through => :units
  has_many :deployments, :conditions => ['start_time < ? and end_time > ?', Time.now, Time.now]
  has_many :teams, :through => :deployments
  attr_accessible :name
  scope :alphabetical, :order => :name
end

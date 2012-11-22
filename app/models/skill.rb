class Skill < ActiveRecord::Base
  attr_accessible :description, :name
  
  scope :alphabetical, :order => :name
end

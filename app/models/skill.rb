class Skill < ActiveRecord::Base
  has_many :aptitudes
  has_many :people, :through => :aptitudes
  has_many :roles
  has_many :teams, :through => :roles
  attr_accessible :description, :name
  
  scope :alphabetical, :order => 'skills.name'
end

class PhaseTemplate < ActiveRecord::Base
  has_many :steps, :order => :position
  has_many :tasks, :through => :steps
  attr_accessible :name
  scope :alphabetical, :order => :name
end

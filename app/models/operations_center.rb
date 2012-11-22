class OperationsCenter < ActiveRecord::Base
  belongs_to :unit
  attr_accessible :description, :name, :unit_id
  
  scope :alphabetical, :order => :name
end

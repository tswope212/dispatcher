class OperationsCenter < ActiveRecord::Base
  belongs_to :unit
  has_many :assignments
  has_many :jobs, :through => :assignments
  has_many :units, :through => :jobs
  has_many :dispatches, :through => :jobs
  has_one :address, :through => :unit
  has_one :city, :through => :address
  has_one :neighborhood, :through => :address
  has_many :coordinations
  has_many :coordinators, :through => :coordinations
  attr_accessible :description, :name, :unit_id
  
  scope :alphabetical, :order => :name
end

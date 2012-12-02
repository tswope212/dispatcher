class Task < ActiveRecord::Base
  belongs_to :person
  belongs_to :unit
  has_one :address, :through => :unit
  attr_accessible :person_id, :unit_id, :actual_end, :actual_start, :description, :name, :scheduled_end, :scheduled_start
  scope :alphabetical, :order => :name
end

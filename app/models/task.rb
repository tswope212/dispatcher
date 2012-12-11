class Task < ActiveRecord::Base
  belongs_to :person
  belongs_to :unit
  has_one :address, :through => :unit
  has_many :task_waivers
  has_many :waivers, :through => :task_waivers
  attr_accessible :person_id, :unit_id, :actual_end, :actual_start, :description, :name, :scheduled_end, :scheduled_start
  scope :alphabetical, :order => :name
  
  def self.common_tasks
    PhaseTemplate.find(1, 2).map(&:tasks).flatten
  end
end

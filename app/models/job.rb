class Job < ActiveRecord::Base
  belongs_to :task
  belongs_to :unit
  attr_accessible :task_id, :unit_id, :scheduled_start, :scheduled_end, :actual_start, :actual_end
  
  scope :incomplete, :conditions => {:actual_end => nil}
  def name
    "#{task.name} at #{unit.name}"
  end
end

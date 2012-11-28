class Job < ActiveRecord::Base
  belongs_to :task
  belongs_to :unit
  attr_accessible :task_id, :unit_id
  
  def name
    "#{task.name} at #{unit.name}"
  end
end

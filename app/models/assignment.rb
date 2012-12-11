class Assignment < ActiveRecord::Base
  belongs_to :operations_center
  belongs_to :job
  attr_accessible :operations_center_id, :job_id
  
  scope :by_completion, joins(:job).order('jobs.actual_end asc').order('jobs.actual_start asc')
end

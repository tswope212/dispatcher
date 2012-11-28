class Assignment < ActiveRecord::Base
  belongs_to :operations_center
  belongs_to :job
  attr_accessible :operations_center_id, :job_id
end

class Assignment < ActiveRecord::Base
  belongs_to :operations_center
  belongs_to :task
  attr_accessible :operations_center_id, :task_id
end

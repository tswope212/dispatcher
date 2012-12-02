class TaskWaiver < ActiveRecord::Base
  belongs_to :task
  belongs_to :waiver
  belongs_to :team_admin
  attr_accessible :task_id, :waiver_id
  
  scope :by_task, :order => :task_id
  scope :by_waiver, :order => :waiver_id
end

class Dispatch < ActiveRecord::Base
  belongs_to :team
  belongs_to :job
  belongs_to :person
  attr_accessible :team_id, :job_id
  
  scope :recent, :order => 'created_at desc'
  scope :incomplete, :joins => :job, :conditions => 'jobs.actual_end is null'
  
  def name
    "dispatched to #{job.unit.full_address}"
  end
end

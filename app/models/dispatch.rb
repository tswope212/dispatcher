class Dispatch < ActiveRecord::Base
  belongs_to :team
  belongs_to :job
  has_one :task, :through => :job
  belongs_to :person
  attr_accessible :team_id, :job_id
  
  scope :recent, order('created_at desc')
  scope :unstarted, joins(:job).where('jobs.actual_start is null')
  scope :incomplete, joins(:job).where('jobs.actual_end is null')
  scope :started, incomplete.joins(:job).where('jobs.actual_start is not null')
  scope :unscheduled, unstarted.incomplete.joins(:job).where('jobs.scheduled_start is null')
  scope :scheduled, joins(:job).where('jobs.scheduled_start is not null and jobs.actual_start is null')
  scope :complete, joins(:job).where('jobs.actual_end is not null')
  
  after_create :notify_team_lead, :notify_team_members
  
  define_index do
    indexes team.name
    indexes task.description
    indexes job.scheduled_start
  end
  
  def name
    "dispatched to #{job.unit.full_address}"
  end
  
  def notify_team_lead
    TeamLeaderMailer.job_assigned_notification(self).deliver rescue nil
  end
  
  def notify_team_members
    team.people.each do |volunteer|
      VolunteerMailer.team_dispatched_notification(self, volunteer).deliver rescue nil
    end
  end
end

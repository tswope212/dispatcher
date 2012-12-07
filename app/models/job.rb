class Job < ActiveRecord::Base
  belongs_to :task
  belongs_to :unit
  has_many :dispatches
  has_many :teams, :through => :dispatches
  attr_accessible :task_id, :unit_id, :scheduled_start, :scheduled_end, :actual_start, :actual_end
  
  scope :complete, :conditions => 'actual_end is not null'
  scope :incomplete, :conditions => {:actual_end => nil}
  scope :unstarted, :conditions => {:actual_start => nil, :actual_end => nil}
  
  def name
    "#{task.name} at #{unit.name}"
  end
  
  def waived?
    task.task_waivers.all? do |task_waiver|
      unit.andand.person.andand.waivers.andand.include? task_waiver.waiver
    end
  end
end

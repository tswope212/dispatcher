class Job < ActiveRecord::Base
  belongs_to :task
  belongs_to :unit
  has_one :address, :through => :unit
  has_one :city, :through => :address
  has_one :resident, :through => :unit
  has_many :languages, :through => :resident
  has_many :dispatches
  has_many :teams, :through => :dispatches
  has_many :notes, :dependent => :destroy
  attr_accessible :task_id, :unit_id, :scheduled_start, :scheduled_end, :actual_start, :actual_end
  
  scope :complete, :conditions => 'actual_end is not null'
  scope :incomplete, :conditions => {:actual_end => nil}
  scope :unstarted, :conditions => {:actual_start => nil, :actual_end => nil}
  scope :by_completion, order('actual_end asc').order('actual_start asc')
  scope :dispatched, joins(:dispatches)
  scope :recent, order('created_at desc')
  
  def self.not_dispatched
    all - dispatched
  end
  
  def name
    "#{task.andand.name} at #{unit.andand.full_address}"
  end
  
  def waived?
    task.task_waivers.all? do |task_waiver|
      unit.andand.person.andand.waivers.andand.include? task_waiver.waiver
    end
  end
  
  def completion_state
    if actual_start.blank?
      'Unstarted'
    elsif actual_end.blank?
      'In Progress'
    else
      'Complete'
    end
  end
end

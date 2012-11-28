class Step < ActiveRecord::Base
  belongs_to :phase_template
  belongs_to :task
  attr_accessible :phase_template_id, :position, :task_id
  acts_as_list :scope => :phase_template_id
  
  def name
    task.name
  end
end

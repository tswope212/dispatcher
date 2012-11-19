class Dispatch < ActiveRecord::Base
  belongs_to :team
  belongs_to :task
  belongs_to :person
  attr_accessible :team_id, :task_id
end

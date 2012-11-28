class Dispatch < ActiveRecord::Base
  belongs_to :team
  belongs_to :job
  belongs_to :person
  attr_accessible :team_id, :job_id
end

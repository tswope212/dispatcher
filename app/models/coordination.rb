class Coordination < ActiveRecord::Base
  belongs_to :operations_center
  belongs_to :coordinator
  belongs_to :team_admin
  attr_accessible :operations_center_id, :coordinator_id
end

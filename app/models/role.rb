class Role < ActiveRecord::Base
  belongs_to :person
  belongs_to :team
  belongs_to :skill
  attr_accessible :person_id, :team_id, :skill_id
end

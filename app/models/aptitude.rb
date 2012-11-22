class Aptitude < ActiveRecord::Base
  belongs_to :person
  belongs_to :skill
  attr_accessible :description, :level, :person_id, :skill_id
  
  scope :by_skill, :order => :skill_id
end

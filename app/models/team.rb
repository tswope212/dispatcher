class Team < ActiveRecord::Base
  belongs_to :person
  attr_accessible :name, :person_id
end

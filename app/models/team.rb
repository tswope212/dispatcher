class Team < ActiveRecord::Base
  belongs_to :person
  has_many :roles
  attr_accessible :name, :person_id
end

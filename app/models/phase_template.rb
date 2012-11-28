class PhaseTemplate < ActiveRecord::Base
  has_many :steps
  has_many :tasks, :through => :steps
  attr_accessible :name
end

class Waiver < ActiveRecord::Base
  has_many :signatures
  has_many :task_waivers
  attr_accessible :signature_type, :text, :name
end

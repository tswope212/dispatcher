class Waiver < ActiveRecord::Base
  has_many :signatures
  has_many :task_waivers
  attr_accessible :signature_type, :text, :name, :visible_to_residents, :visible_to_volunteers, :required_for_volunteers, :required_for_residents
  scope :visible_to_residents, where({ :visible_to_residents => true })
  scope :visible_to_volunteers, where({ :visible_to_volunteers => true })
  scope :required_for_volunteers, where({ :required_for_volunteers => true })
end

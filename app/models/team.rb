class Team < ActiveRecord::Base
  belongs_to :person
  has_many :roles
  has_many :people, :through => :roles
  has_many :languages, :through => :people
  has_many :dispatches
  has_many :jobs, :through => :dispatches
  attr_accessible :name, :person_id, :image, :group_me_number
  scope :alphabetical, :order => :name
  mount_uploader :image, ProfileImageUploader
end

class Team < ActiveRecord::Base
  belongs_to :person
  has_many :roles
  has_many :people, :through => :roles
  has_many :languages, :through => :people
  has_many :dispatches
  has_many :jobs, :through => :dispatches
  attr_accessible :name, :person_id, :image, :group_me_number, :phone_number, :email
  scope :alphabetical, :order => :name
  scope :by_newest_member, lambda { |order| joins(:roles).order("roles.created_at #{order}") }
  scope :by_latest_job, lambda { |order| joins(:jobs).order("jobs.actual_end #{order}").where('jobs.actual_end is not null') }
  mount_uploader :image, ProfileImageUploader
end

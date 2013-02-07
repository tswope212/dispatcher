class Feedback < ActiveRecord::Base
  belongs_to :person
  belongs_to :resident
  belongs_to :coordinator
  belongs_to :team_admin
  attr_accessible :email, :ip, :message, :name, :read, :starred
end

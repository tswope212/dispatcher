class Feedback < ActiveRecord::Base
  belongs_to :person
  belongs_to :resident
  belongs_to :coordinator
  belongs_to :team_admin
  belongs_to :read_by, :class_name => 'TeamAdmin', :foreign_key => :read
  belongs_to :starred_by, :class_name => 'TeamAdmin', :foreign_key => :starred
  attr_accessible :email, :ip, :message, :name, :read, :starred
  scope :recent, order('created_at desc')
  
  after_create :deliver_to_feedback_inbox
  
  def deliver_to_feedback_inbox
    FeedbackMailer.feedback_notification(self).deliver
  end
end

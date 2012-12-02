class Deployment < ActiveRecord::Base
  belongs_to :city
  belongs_to :team
  attr_accessible :end_time, :start_time, :city_id, :team_id
  
  scope :current, lambda { where(['start_time < ? and end_time > ?', Time.now, Time.now]) }
end

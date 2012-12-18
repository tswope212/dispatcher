class TaylorMailer < ActionMailer::Base
  default from: "disasterdispatcher.net@gmail.com"
  
  def activation_authorization team_admin
    @team_admin = team_admin
    mail :to => 'tswope212@gmail.com', :subject => 'New Team Admin'
  end
end

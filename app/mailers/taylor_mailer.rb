class TaylorMailer < ActionMailer::Base
  default from: "bot@disasterdispatcher.net"
  
  def activation_authorization team_admin
    @team_admin = team_admin
    mail :to => 'tswope212@gmail.com', :subject => 'New Team Admin'}
  end
end

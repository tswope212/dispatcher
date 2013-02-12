class TeamAdminMailer < ActionMailer::Base
  default from: "disasterdispatcher.net@gmail.com"

  def activation_message team_admin
    @team_admin = team_admin
    
    mail :to => team_admin.email, :subject => "You have been granted admin access."
  end
end

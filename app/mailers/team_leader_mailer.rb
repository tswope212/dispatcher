class TeamLeaderMailer < ActionMailer::Base
  def job_assigned_notification dispatch
    @job = dispatch.job
    @team = dispatch.team
    @leader = @team.person
    mail :to => @leader.email, :subject => "job assigned: #{@job.name}", :from => 'disasterdispatcher.net@gmail.com'
  end
end
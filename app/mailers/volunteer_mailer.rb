class VolunteerMailer < ActionMailer::Base
  default from: "disasterdispatcher.net@gmail.com"
  
  def team_dispatched_notification dispatch, person
    @volunteer = person
    @job = dispatch.job
    @task = @job.task
    @unit = @job.unit
    @address = @job.address
    mail :to => @volunteer.email, :subject => 'Your team has been dispatched.'
  end
end
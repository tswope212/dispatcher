class ResidentRegistrationMailer < ActionMailer::Base
  def registration_receipt resident
    @resident = resident
    mail :to => @resident.email, :subject => 'Dispatcher Registration Received', :from => 'info@disasterdispatcher.net'
  end
end
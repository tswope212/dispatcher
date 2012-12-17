class ResidentRegistrationMailer < ActionMailer::Base
  def registration_receipt resident
    @resident = resident
    mail :to => @resident.email, :subject => 'Dispatcher Registration Received', :from => 'info@disasterdispatcher.net'
  end
  
  def password_generated_notification resident, password
    @resident = resident
    @password = password
    mail :to => @resident.email, :subject => 'A password has been set for your Dispatcher account.'
  end
end
class ResidentRegistrationMailer < ActionMailer::Base
  default from: "disasterdispatcher.net@gmail.com"
  
  def registration_receipt resident
    @resident = resident
    mail :to => @resident.email, :subject => 'Dispatcher Registration Received'
  end
  
  def password_generated_notification resident, password
    @resident = resident
    @password = password
    mail :to => @resident.email, :subject => 'A password has been set for your Dispatcher account.'
  end
end
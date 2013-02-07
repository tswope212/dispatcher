class FeedbackMailer < ActionMailer::Base
  default from: "disasterdispatcher.net@gmail.com"
  
  def feedback_notification feedback
    @feedback = feedback
    mail :to => 'feedback@disasterdispatcher.com', :subject => "Feedback from #{feedback.name}", :reply_to => feedback.email
  end
end
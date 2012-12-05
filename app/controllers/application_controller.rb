class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'front'
  
  def authenticate_person_or_admin!
    return true if current_person || current_team_admin
    authenticate_person!
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'front'
  
  private
  def authenticate_person_or_admin!
    return true if current_person || current_team_admin
    authenticate_person!
  end
  
  def authenticate_person_or_coordinator!
    return true if current_person || current_coordinator
    authenticate_person!
  end
  
  def authenticate_team_admin_or_coordinator!
    return true if current_team_admin || current_coordinator
    authenticate_coordinator!
  end
end

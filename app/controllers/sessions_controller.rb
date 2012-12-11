class SessionsController < Devise::SessionsController
  after_filter :log_in_all_accounts, :only => :create
  
  private
  def log_in_all_accounts
    if current_person
      if admin = TeamAdmin.find_by_email(current_person.email)
        sign_in admin
      end
    elsif current_team_admin
      if volunteer = Person.find_by_email(current_team_admin.email)
        sign_in volunteer
      end
    end
    
  end
end
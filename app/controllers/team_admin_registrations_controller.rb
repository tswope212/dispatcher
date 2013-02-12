class TeamAdminRegistrationsController < Devise::RegistrationsController

  before_filter :generate_password, :only => :create
  skip_before_filter :require_no_authentication, :only => :create
  
  def generate_password
    params[:team_admin][:password] = params[:team_admin][:password_confirmation] = SecureRandom.hex(5)
  end

end

class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for resource
    edit_person_path resource
  end
end
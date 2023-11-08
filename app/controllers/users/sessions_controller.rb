# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Patient)
      patients_path
    elsif resource.is_a?(Doctor)
      dashboard_doctor_path(resource)
    elsif resource.is_a?(Assistant)
      dashboard_assistant_path(resource)
    else
      super
    end
  end
end

class DoctorsController < ApplicationController
	# before_action :authenticate_user!
  def dashboard
    @doctor = current_user # Assuming the doctor is the currently logged-in user
    @appointments = @doctor.appointments
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
  
  def showall
    # In your controller action
      @doctors = Doctor.all
  end
end

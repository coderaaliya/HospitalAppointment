class AppointmentsController < ApplicationController
  # ...

  # Action for displaying the appointment form
  def new
    @appointment = Appointment.new
  end

  # Action for creating a new appointment
  def create
    @appointment = current_user.appointments.new(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment), notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :assistant_id, :patient_id)
  end

  # ...
end

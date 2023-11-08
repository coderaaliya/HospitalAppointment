class PatientsController < ApplicationController
  before_action :authenticate_user! 

  def index
    # Check if a patient is signed in
    if current_user.is_a?(Patient)
      @patient = current_user
      @appointments = @patient.appointments
    else
      redirect_to root_path, alert: "You must be signed in as a patient to view this page."
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments
  end

  # Action for booking an appointment
  def book_appointment
    @patient = current_user
    @appointment = Appointment.new
    @doctors = Doctor.all
    @assistants = Assistant.all
  end

  def create_appointment
    @patient = current_user
    @appointment = @patient.appointments.build(appointment_params)
    if @appointment.save
      redirect_to patient_path(@patient), notice: 'Appointment was successfully created.'
    else
      render 'book_appointment'
    end
  end
 
 def destroy_appointment
    @patient = current_user
    @appointment = @patient.appointments.find(params[:appointment_id])
    @appointment.destroy
    redirect_to patient_path(@patient), notice: 'Appointment was successfully destroyed.'
  end

  

  private

  def appointment_params
    params.require(:appointment).permit(:date, :doctor_id, :assistant_id)
  end

  # ...
end

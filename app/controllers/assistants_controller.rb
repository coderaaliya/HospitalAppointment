class AssistantsController < ApplicationController
	before_action :authenticate_user!
  def dashboard
    @assistant = current_user # Assuming the assistant is the currently logged-in user
    @appointments = @assistant.appointments
  end
end

class Appointment < ApplicationRecord
  belongs_to :assistant, class_name: 'User', foreign_key: 'assistant_id'
  belongs_to :patient, class_name: 'User', foreign_key: 'patient_id'
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
end

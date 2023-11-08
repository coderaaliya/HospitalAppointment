class Patient < User
	validates :age, presence: true
	validates_absence_of :specialization
	has_many :appointments
	def admin?
    false # Replace with your logic to determine if this user is an admin
  end
end

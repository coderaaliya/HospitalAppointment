class Doctor < User
	validates :specialization, presence: true
	validates_absence_of :age
	has_many :appointments
end

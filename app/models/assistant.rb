class Assistant < User
	validates_absence_of :specialization
	validates_absence_of :age
	has_many :appointments
end

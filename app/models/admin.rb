class Admin < User
	def admin?
    true # or implement the logic to check if this user is an admin
  end
end

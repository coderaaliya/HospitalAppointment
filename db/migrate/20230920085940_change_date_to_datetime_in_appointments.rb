class ChangeDateToDatetimeInAppointments < ActiveRecord::Migration[7.0]
  def change
     change_column :appointments, :date, :datetime
  end
end

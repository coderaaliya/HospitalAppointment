class AddMessageToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :message, :text
  end
end

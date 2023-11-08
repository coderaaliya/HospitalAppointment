class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :assistant, null: false
      t.references :patient, null: false
      t.references :doctor, null: false

      t.timestamps
    end
  end
end

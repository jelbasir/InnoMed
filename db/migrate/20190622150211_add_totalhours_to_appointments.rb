class AddTotalhoursToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :totalhours, :integer
  end
end

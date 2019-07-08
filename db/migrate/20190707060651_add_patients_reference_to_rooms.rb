class AddPatientsReferenceToRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :rooms, :patient, foreign_key: true
  end
end

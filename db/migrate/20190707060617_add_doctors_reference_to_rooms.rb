class AddDoctorsReferenceToRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :rooms, :doctor, foreign_key: true
  end
end

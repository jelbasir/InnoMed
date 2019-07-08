class AddFromToRoomMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_messages, :from, polymorphic: true, index: true
  end
end

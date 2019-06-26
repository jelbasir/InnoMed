class RoomMessage < ApplicationRecord
  belongs_to :patient, doctor 
  belongs_to :room, inverse_of: :room_messages
end

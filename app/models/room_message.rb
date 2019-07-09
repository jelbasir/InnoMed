class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :from, polymorphic: true

  belongs_to :patient, optional: true
  belongs_to :doctor, optional: true
end
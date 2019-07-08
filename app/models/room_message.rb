# frozen_string_literal: true

# == Schema Information
#
# Table name: room_messages
#
#  id         :integer          not null, primary key
#  from_type  :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  from_id    :integer
#  room_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_room_messages_on_from_type_and_from_id  (from_type,from_id)
#  index_room_messages_on_room_id                (room_id)
#  index_room_messages_on_user_id                (user_id)
#

class RoomMessage < ApplicationRecord
  belongs_to :room, inverse_of: :room_messages
  belongs_to :from, polymorphic: true

  belongs_to :patient, optional: true
  belongs_to :doctor, optional: true
end

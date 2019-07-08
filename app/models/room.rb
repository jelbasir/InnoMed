# frozen_string_literal: true

# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer
#  patient_id :integer
#
# Indexes
#
#  index_rooms_on_doctor_id   (doctor_id)
#  index_rooms_on_name        (name) UNIQUE
#  index_rooms_on_patient_id  (patient_id)
#


class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy,
                           inverse_of: :room
  belongs_to :doctor
  belongs_to :patient
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  end        :datetime
#  start      :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer
#
# Indexes
#
#  index_schedules_on_doctor_id  (doctor_id)
#


class Schedule < ApplicationRecord
  belongs_to :doctor

  validates :start, uniqueness: { scope: :doctor_id, message: 'You have already made this time available' }
end

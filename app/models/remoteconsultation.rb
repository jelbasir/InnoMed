# frozen_string_literal: true

# == Schema Information
#
# Table name: remoteconsultations
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Remoteconsultation < ApplicationRecord
  has_many :consultations, dependent: :destroy
  # dependent: :destroy means the consultations related
  # to the specific post in mention get deleted if the post does.
end

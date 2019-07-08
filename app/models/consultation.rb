# frozen_string_literal: true

# == Schema Information
#
# Table name: consultations
#
#  id                    :integer          not null, primary key
#  consultation          :text
#  name                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  remoteconsultation_id :integer
#


class Consultation < ApplicationRecord
  belongs_to :remoteconsultation
end

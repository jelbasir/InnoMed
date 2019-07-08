# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#


class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'Patient'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'Doctor'

  has_many :messages, dependent: :destroy

  validates :sender_id, uniqueness: { scope: :recipient_id }

  scope :between, lambda { |sender_id, recipient_id|
    where('(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)', sender_id, recipient_id, recipient_id, sender_id)
  }
end

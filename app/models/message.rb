# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  body            :text
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#


class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, :conversation_id, :user_id, presence: true

  def message_time
    created_at.strftime('%m/%d/%y at %l:%M %p')
  end
end

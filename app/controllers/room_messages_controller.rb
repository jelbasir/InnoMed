# frozen_string_literal: true

class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create(
      from: current_user,
      room: @room,
      message: message_params[:message]
    )

    RoomChannel.broadcast_to @room, {
      message: @room_message.message,
      updated_at: @room_message.updated_at,
      avatar: @room_message.from.try(:image_url)
    }

    render json: @room_message.to_json
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

  def current_user
    current_doctor || current_patient
  end

  def message_params
    params.require(:room_message).permit(:room_id, :message)
  end
end

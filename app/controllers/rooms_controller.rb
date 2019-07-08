# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    @users = current_doctor ? Patient.all : Doctor.all
  end

  def show
    @users = current_doctor ? Patient.all : Doctor.all

    @doctor = current_doctor || Doctor.find(params[:doctor_id])
    @patient = current_patient || Patient.find(params[:patient_id])
    @room = Room.find_or_create_by(
      doctor: @doctor,
      patient: @patient
    )
    @room_messages = @room.room_messages
  end

  private
  def room_params

  end
end

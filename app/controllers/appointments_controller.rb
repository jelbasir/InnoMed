# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[edit update destroy]
  before_action :set_patient
  before_action :set_doctors, only: %i[new create]

  def index
    @appointments = @patient.appointments.order(:appointmentdate, :appointmenttime)
  end

  def show
    @doctor = @appointment.doctor.find(params[:id])
    @patient = @appointment.params.find(params[:patient_id])
  end

  def new
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)

    if @appointment.save
      # flash[:success] = "You have updated #{@appointment.appointmentdate.year} #{@appointment.appointmentdate.month} #{@appointment.appointmentdate.day}."
      @schedule = Schedule.create(title: 'Booked', start: DateTime.zone.new(@appointment.appointmentdate.year, @appointment.appointmentdate.month, @appointment.appointmentdate.day, @appointment.appointmenttime.hour, @appointment.appointmenttime.min, @appointment.appointmenttime.sec), end: DateTime.zone.new(@appointment.appointmentdate.year, @appointment.appointmentdate.month, @appointment.appointmentdate.day, @appointment.appointmenttime.hour + 1, @appointment.appointmenttime.min, @appointment.appointmenttime.sec), doctor_id: @appointment.doctor_id)
      # redirect_to patient_appointments_payment_path

      render :payment
    else
      render :new
    end
  end

  def payment
    redirect_to patient_appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctors
    @doctors = Doctor.all.order('last_name')
  end

  def set_patient
    @patient = current_patient
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :appointmentdate, :appointmenttime)
  end
end

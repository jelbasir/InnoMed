# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id              :integer          not null, primary key
#  appointmentdate :date
#  appointmenttime :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  doctor_id       :integer
#  patient_id      :integer
#
# Indexes
#
#  index_appointments_on_doctor_id   (doctor_id)
#  index_appointments_on_patient_id  (patient_id)
#


class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
end

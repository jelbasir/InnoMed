json.extract! appointment, :id, :appointmentdate, :appointmenttime, :patient_id, :doctor_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

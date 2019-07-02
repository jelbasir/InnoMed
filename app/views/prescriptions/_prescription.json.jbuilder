json.extract! prescription, :id, :patient_id, :doctor_id, :prescription, :prescription_cost, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)

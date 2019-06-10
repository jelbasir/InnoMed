json.extract! patient, :id, :photo, :first_name, :last_name, :age, :phoneNo, :email, :gender, :address, :insurance, :created_at, :updated_at
json.url patient_url(patient, format: :json)

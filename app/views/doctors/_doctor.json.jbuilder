json.extract! doctor, :id, :first_name, :middle_name, :last_name, :image_url, :speciality, :bio, :address, :email, :phone_no, :gp_number, :created_at, :updated_at, :hourlycharge
json.url doctor_url(doctor, format: :json)

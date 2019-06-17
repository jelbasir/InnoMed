class Schedule < ApplicationRecord
  
  belongs_to :doctor
  
  validates :start, uniqueness: { scope: :doctor_id, message: "You have already made this time available" }
  
  
end

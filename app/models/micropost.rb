class Micropost < ApplicationRecord
  belongs_to :patient
  
  default_scope -> { order(created_at: :desc) }
  
  validates :patient_id, presence: true
  
  validates :content, presence: true, length: { maximum: 140 }

  
end

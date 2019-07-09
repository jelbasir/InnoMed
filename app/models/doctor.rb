class Doctor < ApplicationRecord

validates :first_name,  presence: true, length: { maximum: 50 }
validates :last_name,  presence: true, length: { maximum: 50 }
validates :hourlycharge, presence:true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: true
has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

has_many :appointments, dependent: :destroy
has_many :patients, through: :appointments
has_many :schedules, dependent: :destroy

  
def full_name
        "#{self.first_name} #{self.last_name}"
end
    
end

class Doctor < ApplicationRecord

has_many :appointments, dependent: :destroy
has_many :patients, through: :appointments
has_many :schedules, dependent: :destroy

  
def full_name
        "#{self.first_name} #{self.last_name}"
end
    
end

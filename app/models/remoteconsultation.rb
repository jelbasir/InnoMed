class Remoteconsultation < ApplicationRecord

	    has_many :consultations, dependent: :destroy
      # dependent: :destroy means the consultations related
      # to the specific post in mention get deleted if the post does.


end

# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = Patient.find_by(id: cookies.signed['patient.id'])
        verified_user
      elsif verified_user = Doctor.find_by(id: cookies.signed['doctor.id'])
      else
        reject_unauthorized_connection
      end
    end
  end
end

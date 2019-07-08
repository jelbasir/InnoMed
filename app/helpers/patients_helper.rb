# frozen_string_literal: true

module PatientsHelper
  def gravatar_for(patient, size: 80)
    gravatar_id = Digest::MD5.hexdigest(patient.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: patient.first_name, class: 'gravatar')
  end
end

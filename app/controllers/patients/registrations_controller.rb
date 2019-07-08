# frozen_string_literal: true

class Patients::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: %i[new create]

  before_action :configure_sign_up_params, only: :create

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        first_name
        last_name
        gender
        phoneNo
        insurance
        address
        dob
      ]
    )
  end

  def after_sign_up_path_for(resource)
    patient_path(resource)
  end
end

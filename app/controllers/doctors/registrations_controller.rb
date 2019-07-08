# frozen_string_literal: true

class Doctors::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]
end

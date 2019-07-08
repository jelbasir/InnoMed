# frozen_string_literal: true

class Doctors::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user, only: :destroy
end

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_patient
      flash.clear
      redirect_to(root_path(role: :patient)) && return
    elsif current_doctor
      flash.clear
      redirect_to(root_path(role: :doctor)) && return
    end
  end
end

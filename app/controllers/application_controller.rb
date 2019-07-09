class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :set_my_variable

   private

   def set_my_variable
     if logged_in?
         puts current_user.user_type
     if(current_user.user_type == "patient")
         @current_patient = Patient.where(:user_id => current_user.id).first
     else
        @current_doctor = Doctor.where(:user_id => current_user.id).first
     end
     
   end
   end
  
  
end

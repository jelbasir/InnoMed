module SessionsHelper
    # Logs in the given user.
  def log_in(patient)
    session[:patient_id] = patient.id
  end
   # Returns the current logged-in patient (if any).
  def current_patient
    if session[:patient_id]
      @current_patient ||= Patient.find_by(id: session[:patient_id])
    end
  end
  
   # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_patient.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:patient_id)
    @current_patient = nil
  end
  
end

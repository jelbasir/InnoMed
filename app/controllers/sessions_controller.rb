class SessionsController < ApplicationController
  def new
  end

  def create
      patient = Patient.find_by(email: params[:session][:email].downcase)
    if patient && patient.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in patient
      redirect_to patient
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

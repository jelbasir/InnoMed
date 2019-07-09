class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      patient = Patient.find_by(email: params[:session][:email].downcase)
      doctor = Doctor.find_by(email: params[:session][:email].downcase)
      puts user.user_type
      puts "---------------------=========="
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      
        if user.user_type == "patient"
          puts "logging in as patient"
          log_in user
          redirect_to patient
        else 
          puts "log in doctor"
          log_in user
          puts "redirecting to doctor"
          redirect_to doctor
        end
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


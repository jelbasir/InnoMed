class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]
  before_action :set_patient
  before_action :set_doctors 
  #, only: [:new, :create]
  
  def index
    if current_user.user_type == "patient"
    @appointments = Appointment.where(:patient_id => @patient).order(:appointmentdate, :appointmenttime)
    else
    @appointments = Appointment.where(:doctor_id => @doctor).order(:appointmentdate, :appointmenttime)
     #@appointments = @doctor.appointments.order(:appointmentdate, :appointmenttime)
    end
  end
  
  def show
    if current_user.user_type == "patient"
    #@doctor = @appointment.doctor.find(params[:id])
    @patient = @appointment.params.find(params[:patient_id])
    else
    @doctor = @appointment.params.find(params[:doctor_id])
    #@patient = @appointment.params.find(params[:id])
  end
  end

  def new
    @appointment = @patient.appointments.new
   #puts "_______________==========="
    #puts @current_patient
    #@appointment = Patient.find(@current_patient).appointments.new
  end

  def create
     
    @appointment = @patient.appointments.new(appointment_params)
   
    if @appointment.save
       #flash[:success] = "You have updated #{@appointment.appointmentdate.year} #{@appointment.appointmentdate.month} #{@appointment.appointmentdate.day}."
       @schedule = Schedule.create(:title => 'Booked' , :start => DateTime.new(@appointment.appointmentdate.year,@appointment.appointmentdate.month, @appointment.appointmentdate.day, @appointment.appointmenttime.hour,@appointment.appointmenttime.min,@appointment.appointmenttime.sec) , :end => DateTime.new(@appointment.appointmentdate.year,@appointment.appointmentdate.month, @appointment.appointmentdate.day, @appointment.appointmenttime.hour +  1,@appointment.appointmenttime.min,@appointment.appointmenttime.sec), :doctor_id => @appointment.doctor_id)
       #redirect_to patient_appointments_payment_path


       render :payment
    else
      render :new
    end
  end

  def payment

      redirect_to patient_appointments_path

  end 

   private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
    
    def set_doctors
      if current_user.user_type == "patient"
      @doctors =  Doctor.all.order("last_name")
      else
       @doctor = @current_doctor
      end
    end
    
    def set_patient
      if current_user.user_type == "patient"
      @patient = @current_patient
      else
      @patients =  Patient.all.order("last_name")
      end
    end
    
    def appointment_params
      params.require(:appointment).permit(:doctor_id, :appointmentdate, :appointmenttime)
    end

end
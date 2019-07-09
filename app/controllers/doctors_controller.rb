class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @doctor  = Doctor.find(params[:id])
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    user_params = {
    email: doctor_params["email"],
    password: doctor_params["password"],
    user_type: "doctor"
  }
  
   user = User.new(user_params) 
   user.save!
   new_params = doctor_params
   new_params["user_id"] = user.id
   @doctor = Doctor.new(new_params)    # Not the final implementation!
   if @doctor.save
    log_in @doctor
    flash[:success] = "Welcome to the Inno Med App!"
    redirect_to @doctor
   else
     format.html { render :new }
     format.json { render json: @doctor.errors, status: :unprocessable_entity }
     # render 'new'
   end
    
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
        flash[:success] = "Welcome to the Inno Med App!"
        redirect_to @doctor
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :middle_name, :last_name, :image_url, :speciality, :bio, :address, :email, :phone_no, :gp_number, :password, :hourlycharge,:password_confirmation)
    end
end

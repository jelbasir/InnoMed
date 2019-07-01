class ConsultationController < ApplicationController


	def create
        @remoteconsultation = Remoteconsultation.find(params[:remoteconsultation_id])
         @consultation = @remoteconsultations.comments.create(params[:consultation].permit(:name, :consultation))
        redirect_to remoteconsultation_path(@remoteconsultations)
    end

    def destroy
        @remoteconsultation = Remoteconsultation.find(params[:remoteconsultation_id])
        @consultation = @remoteconsultation.comments.find(params[:id])
        @consultation.destroy
        redirect_to remoteconsultation_path(@remoteconsultation)
    end

end



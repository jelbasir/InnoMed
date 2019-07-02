class RemoteconsultationsController < ApplicationController
  

	def index
		@remoteconsultation = Remoteconsultation.all.order("created_at DESC")

	end

	def new 
		@remoteconsultation = Remoteconsultation.new 
	end

	def create 
		@remoteconsultation = Remoteconsultation.new(remoteconsultation_params)

		if @remoteconsultation.save

			redirect_to @remoteconsultation

		else
			render 'new'
    	end
	end 


    def show
        #@remoteconsultation = Remoteconsultation.new(params[:id])
         @remoteconsultation = Remoteconsultation.find(params[:id])
    end

    def update
        @remoteconsultation = Remoteconsultation.find(params[:id])

        if @remoteconsultation.update(remoteconsultation_params)
            redirect_to @remoteconsultation
        else
            render 'edit'
        end
    end


    def edit
        @remoteconsultation = Remoteconsultation.find(params[:id])
    end

    def destroy
        @remoteconsultation = Remoteconsultation.find(params[:id])
        @remoteconsultations.destroy

        redirect_to remoteconsultation_path
    end

	private 

	def remoteconsultation_params
		#params(:remoteconsultation).permit(:title, :content)
		params.require(:remoteconsultation).permit(:title, :content)
	end
end




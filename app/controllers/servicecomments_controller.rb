class ServicecommentsController < ApplicationController
	def create
		@servicio = Servicio.find(params[:servicio_id])
		@comment = @servicio.servicecomments.create(servicecomments_params)

		@comment.user = current_user
		@comment.save
		redirect_to servicio_path(@servicio)
	end

	def destroy
		@servicio = Servicio.find(params[:servicio_id])
		@comment = @servicio.servicecomments.find(params[:id])
    	@comment.destroy
    	redirect_to servicio_path(@servicio)
	end

	def servicecomments_params
		params.require(:servicecomment).permit(:user, :body)
	end
end

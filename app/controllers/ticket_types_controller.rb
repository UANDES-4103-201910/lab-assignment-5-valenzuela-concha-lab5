class TicketTypesController < ApplicationController

	def index
		@ticket_types = TicketType.all

		respond_to do |format|
			format.json {render json: @ticket_types}
		end
	end

	def show
		@ticket_type = TicketType.find(params[:id])
	end

	def new
		@ticket_type = TicketType.new
	end

	def edit
		@ticket_type = TicketType.find(params[:id])
	end


	def create
		@ticket_type = TicketType.new(ticket_type_params)
	 
		if @ticket_type.save
	  		redirect_to @ticket_type
	  	else
	  		render 'new'
	  	end
	end

	def update

		@ticket_type = TicketType.find(params[:id])

		if @ticket_type.update(ticket_type_params)
			redirect_to @ticket_type
		else
		    render 'edit'
		end
	end

	def destroy
  		@ticket_type = TicketType.find(params[:id])
  		@ticket_type.destroy
 
  		redirect_to ticket_types_path
	end


	private
	  def ticket_type_params

	    params.require(:ticket_type).permit(:event_id, :price, :ticket_zone_id)

	  end
end

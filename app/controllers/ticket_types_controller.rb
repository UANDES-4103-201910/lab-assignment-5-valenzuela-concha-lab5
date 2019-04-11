class TicketTypesController < ApplicationController

	def index
		@ticket_types = TicketType.all
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
		respond_to do |format|
      		if @ticket_type.save
        		format.html { redirect_to @ticket_type, notice: 'Ticket Type was successfully created.' }
	        	format.json { render :show, status: :created, location: @ticket_type }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def update

		@ticket_type = TicketType.find(params[:id])
		respond_to do |format|
	    	if @ticket_type.update(ticket_type_params)
	        	format.html { redirect_to @ticket_type, notice: 'Ticket Type was successfully updated.' }
	        	format.json { render :show, status: :ok, location: @ticket_type }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @ticket_type.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def destroy
  		@ticket_type = Ticket.find(params[:id])
  		@ticket_type.destroy
 		respond_to do |format|
	      format.html { redirect_to ticket_types_url, notice: 'Ticket Type was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end


	private
	  def ticket_type_params

	    params.require(:ticket_type).permit(:event_id, :price, :ticket_zone_id)

	  end
end

class TicketsController < ApplicationController

	def index
		@tickets = Ticket.where(ticket_type_id: params[:ticket_type_id])
	end

	def show
	
		@ticket = Ticket.find(params[:id])


	end

	def new
		@ticket = Ticket.new
	end

	def edit
		@ticket = Ticket.find(params[:id])
	end


	def create
		@ticket = Ticket.new(ticket_params)
		respond_to do |format|
      		if @ticket.save
        		format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
	        	format.json { render :show, status: :created, location: @ticket }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @ticket.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def update

		@ticket = Ticket.find(params[:id])
		respond_to do |format|
	    	if @ticket.update(ticket_params)
	        	format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
	        	format.json { render :show, status: :ok, location: @ticket }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @ticket.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def destroy
  		@ticket = Ticket.find(params[:id])
  		@ticket.destroy
 		respond_to do |format|
	      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end


	private
	  def ticket_params

	    params.require(:ticket).permit(:ticket_type_id, :order_id)

	  end

end

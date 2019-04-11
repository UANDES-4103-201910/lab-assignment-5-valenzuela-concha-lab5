class EventsController < ApplicationController

	def index
		@events = Event.all
	end


	def show
		@event = Event.find(params[:id])
	end

	def new
	end

	def edit
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		respond_to do |format|
      		if @event.save
        		format.html { redirect_to @event, notice: 'Event was successfully created.' }
	        	format.json { render :show, status: :created, location: @event }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @event.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def update

		@event = Event.find(params[:id])
		respond_to do |format|
	    	if @event.update(event_params)
	        	format.html { redirect_to @event, notice: 'Event was successfully updated.' }
	        	format.json { render :show, status: :ok, location: @event }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @event.errors, status: :unprocessable_entity }
	      	end
	    end
	end

	def destroy
  		@event = Event.find(params[:id])
  		@event.destroy
 		respond_to do |format|
	      format.html { redirect_to events_url, notice: 'Event Venue was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	private
		def event_params
			params.require(:event).permit(:name, :description, :event_venue_id, :start_date)
		end



end

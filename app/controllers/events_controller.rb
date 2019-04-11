class EventsController < ApplicationController

	def index
		@events = Event.all
		respond_to do |format|
			format.json {render json: @events}
		end
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

		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

  	def update
  		@event = Event.find(params[:id])
 
  		if @event.update(event_params)
    		redirect_to @event
  		else
    		render 'edit'
  		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to events_path
	end

	private
		def event_params
			params.require(:event).permit(:name, :description, :event_venue_id, :start_date)
		end



end

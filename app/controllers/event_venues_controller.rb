class EventVenuesController < ApplicationController
  

  def index
  	@event_venues = EventVenue.all

    respond_to do |format|
      format.json {render json: @event_venues}
    end
  end

  def show
  	@event_venue = EventVenue.find(params[:id])
  end

  def new
  	@event_venue = EventVenue.new

  end

  def edit
  	@event_venue = EventVenue.find(params[:id])
  end

  def create
  	@event_venue = EventVenue.new(event_venue_params)

  	if @event_venue.save
  		redirect_to @event_venue
  	else
  		render 'new'
  	end

  end

  def update
  	@event_venue = EventVenue.find(params[:id])
 
  	if @event_venue.update(event_venue_params)
    	redirect_to @event_venue
  	else
    	render 'edit'
  	end
  end


  def destroy
  	@event_venue = EventVenue.find(params[:id])
  	@event_venue.destroy
 
  	redirect_to event_venues_path
  end

  private
  	def event_venue_params
  		params.require(:event_venue).permit(:name, :address, :capacity)
  	end


end

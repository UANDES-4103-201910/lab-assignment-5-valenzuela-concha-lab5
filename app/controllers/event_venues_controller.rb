class EventVenuesController < ApplicationController
  

  def index
  	@event_venues = EventVenue.all
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
    @event_venue = EventVenue.new(event_params)
    respond_to do |format|
          if @event_venue.save
            format.html { redirect_to @event_venue, notice: 'Event Venue was successfully created.' }
            format.json { render :show, status: :created, location: @event_venue }
          else
            format.html { render :new }
            format.json { render json: @event_venue.errors, status: :unprocessable_entity }
          end
      end
  end

  def update

    @event_venue = EventVenue.find(params[:id])
    respond_to do |format|
        if @event_venue.update(event_venue_params)
            format.html { redirect_to @event_venue, notice: 'Event Venue was successfully updated.' }
            format.json { render :show, status: :ok, location: @event_venue }
          else
            format.html { render :edit }
            format.json { render json: @event_venue.errors, status: :unprocessable_entity }
          end
      end
  end

  def destroy
      @event_venue = EventVenue.find(params[:id])
      @event_venue.destroy
    respond_to do |format|
        format.html { redirect_to event_venues_url, notice: 'Event Venue was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
  	def event_venue_params
  		params.require(:event_venue).permit(:name, :address, :capacity)
  	end


end

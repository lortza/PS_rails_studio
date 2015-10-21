class EventsController < ApplicationController
  def index
    @time = Time.now
    @events = Event.all
    #@events = Event.limit(1)
    #@events = ["Kitty Watch", "Porch Swinging", "Back-Porch Sittin", "Big Night Out"] 
  end #index

  def show
    @event = Event.find(params[:id])

  end #show

  def edit
    @event = Event.find(params[:id]) 
  end #edit

  def update
    @event = Event.find(params[:id]) 
    event_params = params.require(:event).
                    permit(:name, :description, :location, :price, :starts_at)
    @event.update(event_params)
    redirect_to event_path(@event)
  end #update
    
    
end #EventsController

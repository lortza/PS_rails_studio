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
    @event.update(event_params) #comes from provate method below
    redirect_to event_path(@event) # or redirect_to @event
  end #update

  def new
    @event = Event.new 
  end #new

  def create    
    @event = Event.new(event_params) # defines a new Event
    @event.save # saves form info
    redirect_to @event # redirects to the show page
  end #create
    

  private

    def event_params
      params.require(:event).permit(:name, :description, :location, :price, :starts_at)
    end #event_params
    
    
    
end #EventsController

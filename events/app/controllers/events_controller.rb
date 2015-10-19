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
    
    
end #EventsController

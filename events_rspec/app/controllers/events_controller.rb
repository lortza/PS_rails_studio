class EventsController < ApplicationController
  def index
    @events = Event.all 
  end #index
    
end

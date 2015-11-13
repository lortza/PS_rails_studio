class EventsController < ApplicationController

  # before_action :set_event

  def index
    @time = Time.now
    @events = Event.upcoming # upcoming method is in the Model
    #@events = Event.limit(1)
  end #index

  def show
    @event = Event.find(params[:id])
  end #show

  def edit
    @event = Event.find(params[:id]) 
  end #edit

  def update
    @event = Event.find(params[:id]) 
    if @event.update(event_params) #comes from provate method below
      #flash[:notice] = "Event successfully updated!"
      redirect_to @event, notice: "Event successfully saved!"
    else
      render :edit # to correct any items that failed validation
    end #if
  end #update

  def new
    @event = Event.new 
  end #new

  def create    
    @event = Event.new(event_params) # defines a new Event
    if @event.save # saves form info
      redirect_to @event # redirects to the show page
    else
      render :new #this keeps the valid data, but shows the form again to fill in the invalid info
    end #if
  end #create

  def destroy
    # @event = Event.find(params[:id]) 
    @event.destroy
    redirect_to events_url
  end #destroy
    
    

  private

    def event_params
      params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
    end #event_params

    def set_event
       @event = Event.find(params[:id])
    end #set_event
       
    
end #EventsController

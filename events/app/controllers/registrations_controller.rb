class RegistrationsController < ApplicationController

  before_action :set_event

  def index
    # @event = Event.find(params[:event_id])
    @registrations = @event.registrations 
  end #index

  def new
    # @event = Event.find(params[:event_id])
    @registration = @event.registrations.new 
  end #new

  def create
    # @event = Event.find(params[:event_id])
    @registration = @event.registrations.new(registration_params)
    if @registration.save
      redirect_to event_registrations_path(@event), notice: "#{@registration.name} is now registered for #{@event.name}"
    else
      render :new
    end #if
  end #create
    

private

  def registration_params
    params.require(:registration).permit(:name, :email, :how_heard, :event_id)
  end #event_params

  def set_event
    @event = Event.find(params[:event_id])
  end #set_event
    
    
end #RegistrationsController

    # t.string   "name"
    # t.string   "email"
    # t.string   "how_heard"
    # t.integer  "event_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

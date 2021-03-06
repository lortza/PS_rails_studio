class EventsController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy] #pragmaticstudios put this action last

  def index
    case params[:scope]
    when "past" then @events = Event.past
    when "free" then @events = Event.free
    else @events = Event.upcoming  
    end #case  
  end #index

  def show
    #@event = Event.find(params[:id])
    @likers = @event.likers
    @likes = @event.likes
    @categories = @event.categories
    if current_user
      @current_like = current_user.likes.find_by(event_id: @event.id)
    end #if current_user
  end
  
  def edit
    #@event = Event.find(params[:id])
  end
  
  def update
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event successfully updated!"
    else
      render :edit
    end #if
  end #update
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created!"
    else
      render :new
    end #if
  end #create

  def destroy
    #@event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, alert: "Event successfully deleted!"
  end
    
private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity, category_ids: [])
  end #event_params

  def set_event
    @event = Event.find_by!(slug: params[:id]) 
  end #set_event
    
    
end #EventsController

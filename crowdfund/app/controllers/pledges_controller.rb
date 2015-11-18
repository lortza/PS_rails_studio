class PledgesController < ApplicationController

  before_action :set_project

  def index
    # @project = Project.find(params[:project_id])
    @pledges = @project.pledges
  end #index

  def new #renders the form
     @pledge = @project.pledges.new
  end #new

  def create
    @pledge = @project.pledges.new(pledge_params)
    if @pledge.save # this imploes true
      redirect_to project_pledges_path(@project), notice: "Thanks for supporting #{@project.name}!"
    else
      render :new
    end #if
  end #create

  def show # working on this one
    @project = Project.find(params[:id])
    @pledge = @project.pledges.find(params[:id]) 
  end #show

  def edit 
    @pledge = @project.pledges.find(params[:id]) 
  end #edit

  def update 
    @pledge = @project.pledges.find(params[:id])
    if @pledge.update(pledge_params)
      redirect_to @project, notice: "Success! #{@pledge.name}'s pledge has been updated."
    else
      render :edit
    end #if
  end #update

  def destroy 
    @pledge = Pledge.find(params[:id])
    @pledge.destroy 
    redirect_to project_pledges_url, alert: "#{@project.name} has been deleted"
  end #destroy      

private

  def set_project
    @project = Project.find(params[:project_id]) 
  end #set_project

  def pledge_params
      params.require(:pledge).permit(:name, :city, :email, :comment, :amount) 
  end #pledge_params
     
    
end #PledgesController

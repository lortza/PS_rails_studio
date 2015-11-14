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



    # def sum_pledges(pledges)
  #   @total_pledged = 0
  #   pledges.each do |p|
  #     @total_pledged += p.amount
  #   end #each
  #   number_to_currency(@total_pledged)
  # end #sum_pledges
    
    

private

  def set_project
    @project = Project.find(params[:project_id]) 
  end #set_project

  def pledge_params
      params.require(:pledge).permit(:name, :city, :email, :comment, :amount) 
  end #pledge_params
    

    
    
end #PledgesController

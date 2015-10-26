class ProjectsController < ApplicationController
  def index
    @projects = Project.all 
  end #index

  def show
    @project = Project.find(params[:id]) 
  end #show

  def edit 
    @project = Project.find(params[:id])
  end #edit

  def update 
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end #update

  def new 
    @project = Project.new
  end #new

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to @project 
  end #create
    
    
  private
    def project_params
      params.require(:project).permit(:name, :description, :website, :pledging_ends_on, :target_pledge_amount) 
    end #project_params
      
    
    
end #ProjectsController

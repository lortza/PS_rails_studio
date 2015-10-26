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
    project_params = params.require(:project).permit(:name, :description, :website, :pledging_ends_on, :target_pledge_amount)
    @project.update(project_params)
    redirect_to @project
  end #update
    
    
    
end #ProjectsController

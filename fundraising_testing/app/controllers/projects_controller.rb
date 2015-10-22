class ProjectsController < ApplicationController
  def index
    @projects = Project.all 
  end #index

  def show
    @project = Project.find(params[:id]) 
  end #show
    
    
end #ProjectsController

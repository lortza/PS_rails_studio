class ProjectsController < ApplicationController
  def index
    #@projects = Project.all 
    @projects = Project.accepting_pledges
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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end #destroy
    
    
    
  private
    def project_params
      params.require(:project).permit(:name, :description, :website, :pledging_ends_on, :target_pledge_amount, :image_file_name, :team_members) 
    end #project_params
      
    
    
end #ProjectsController

class FollowsController < ApplicationController

  before_action :require_signin
  before_action :set_project

  def create
    @project.follows.create!(user: current_user)
    redirect_to @project, notice: "Now Following #{@project.name}"
  end #create

  def destroy
    follow = current_user.follows.find(params[:id])
    follow.destroy
    redirect_to @project, notice: "Unsubscribed from #{@project.name}"
  end #destroy

private
  def set_project
    @project = Project.find(params[:project_id]) 
  end #set_project
    
    
end #FollowsController

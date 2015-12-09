class ProjectsController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @projects = Project.accepting_pledges
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new
    @followers = @project.followers
    @categories = @project.categories
    if current_user
      @current_followed_project = current_user.follows.find_by(project_id: @project.id)
    end #if current_user
  end #show

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Success! #{@project.name} has been updated"
    else
      render :edit
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Success! #{@project.name} has been added"
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, alert: "#{@project.name} has been deleted"
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :pledging_ends_on, :target_pledge_amount, :website, :team_members, :image_file_name, category_ids: [])
  end
end

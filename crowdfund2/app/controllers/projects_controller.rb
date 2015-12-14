class ProjectsController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    case params[:filter]
    when "accepting_pledges" then @projects = Project.accepting_pledges
    when "pledging_expired" then @projects = Project.pledging_expired
    else @projects = Project.accepting_pledges
    end #case
  end #index

  def show
    @pledge = Pledge.new
    @followers = @project.followers
    @categories = @project.categories
    if current_user
      @current_followed_project = current_user.follows.find_by(project_id: @project.id)
    end #if current_user
  end #show

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Success! #{@project.name} has been updated"
    else
      render :edit
    end #if
  end #update

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
    @project.destroy
    redirect_to projects_url, alert: "#{@project.name} has been deleted"
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :pledging_ends_on, :target_pledge_amount, :website, :team_members, :image_file_name, :slug, category_ids: [])
  end #project_params

  def set_project
    @project = Project.find_by!(slug: params[:id]) 
  end #set_project
    
end

class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create] #this method lives in the Application Controller
  before_action :require_correct_user, only: [:edit, :update]
  before_action :require_admin, only: [:index, :destroy]

  def new
    @user = User.new 
  end #new

  def index
    @users = User.not_admins
  end #index

  def edit
     @user = User.find(params[:id])
  end #edit

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id #logs in user upon account creation
      redirect_to @user, notice: "Welcome #{@user.name}! Your account has been created."
    else
      render :new
    end #if
  end #create

  def show
    @user = User.find(params[:id])
    @followed_projects = @user.followed_projects
  end #show

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to @user, notice: "#{@user.name}'s account has been successfully updated."
     else
       render :edit
     end
  end #update
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #session[:user_id] = nil
    redirect_to users_url, alert: "#{@user.name}'s account has been deleted."
  end #destroy
    

  private

    def set_user
      @user = User.find(params[:id]) 
    end #set_user
      
    def user_params
       params.require(:user).permit(:name, :email, :username, :location, :password, :password_confirmation)
    end #user_params

    def require_correct_user
      @user = User.find(params[:id]) || @user.admin == true
      redirect_to root_url unless current_user?(@user)
    end #require_correct_user
      
    
end #UsersController

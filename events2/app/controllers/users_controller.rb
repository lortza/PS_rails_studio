class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create] #this method lives in the Application Controller
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end #index

  def show
    #@user = User.find(params[:id]) 
    @registrations = @user.registrations
    @liked_events = @user.liked_events
  end #show

  def new
     @user = User.new
  end #new

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #signs in the user upon account creation
      redirect_to @user, notice: "Thanks for signing up!"
    else
      render :new
    end #if
  end #create  

  def edit
    #@user = User.find(params[:id]) 
  end #edit
  
  def update
     #@user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to @user, notice: "#{@user.name}'s Account successfully updated."
     else
      render :edit
     end #if
  end #update

  def destroy
    #@user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "#{@user.name}'s Account has been successfully deleted."
  end #destroy


private
  
  def set_user
     @user = User.find(params[:id]) 
  end #set_user

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end #user_params

  def require_correct_user
    #@user = User.find(params[:id])
    unless current_user?(@user) 
      redirect_to root_url
    end #unless
  end #require_correct_user
    
    
    
end #UsersController

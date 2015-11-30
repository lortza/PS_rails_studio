class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :user_params

  def index
    @users = User.all 
  end #index

  def show
    #@user = User.find(params[:id]) 
  end #show

  def new
    @user = User.new 
  end #new

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      redirect_to @user, notice: "Welcome #{@user.name}! Thanks for signing up!"
    else
      render :new
    end 
  end #create

  def edit
     #@user = User.find(params[:id])
  end #edit

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.name}'s account has been successfully updated."
     else
       render :edit
     end 
  end #update

  def destroy
    @user.destroy
    @user.destroy
    redirect_to root_url, alert: "#{@user.name}'s Account successfully deleted!"
  end #destroy
    
    
    
    
    
private
  def set_user
    @user = User.find(params[:id]) 
  end #set_user

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end #user_params

end #UsersController

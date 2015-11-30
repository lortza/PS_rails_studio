class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new 
  end #new

  def index
    @users = User.all 
  end #index

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      redirect_to @user, notice: "Welcome #{@user.name}! Your account has been created."
    else
      render :new
    end #if
  end #create

  def show
 
  end #show

  def update
     if @user.update(user_params)
       redirect_to @user, notice: "#{@user.name}'s account has been successfully updated."
     else
       render :edit
     end
  end #update
  
  def destroy
    @user.destroy
    redirect_to root_url, alert: "#{@user.name}'s account has been deleted."
  end #destroy
    
    
    
    
    

  private

  def set_user
    @user = User.find(params[:id]) 
  end #set_user
    
  def user_params
     params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end #user_params
    
end #UsersController

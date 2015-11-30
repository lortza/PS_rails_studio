class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :create, :destroy]

  def new
    @user = User.new 
  end #new

  def index
    @users = User.all 
  end #index
    
    

  private

  def set_user
    @user = User.find(params[:id]) 
  end #set_user
    
  def user_params
     params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end #user_params
    
end #UsersController

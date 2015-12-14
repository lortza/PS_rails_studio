class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update]
  before_action :require_admin, only: [:index, :destroy]

  def index
    @users = User.not_admins
  end #index

  def new
    @user = User.new 
  end #new

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id #signs in the user upon create
      redirect_to @user, notice: "Welcome #{@user.name}! Thanks for signing up!"
    else
      render :new
    end 
  end #create

  def show
    #@user = User.find(params[:id]) 
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end #show

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
    #session[:user_id] = nil
    redirect_to users_url, alert: "#{@user.name}'s Account successfully deleted!"
  end #destroy
    
    
private
  def set_user
    @user = User.find_by!(username: params[:id]) 
  end #set_user

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end #user_params

  def require_correct_user
    #@user = User.find(params[:id]) 
    unless current_user?(@user)
      redirect_to root_url
    end #unless
  end #require_correct_user
    

end #UsersController

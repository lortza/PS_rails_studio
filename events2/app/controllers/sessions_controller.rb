class SessionsController < ApplicationController
  def new
    #renders the new view
  end
  
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end #if
  end #create
end #SessionsController


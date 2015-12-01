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

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Now you're signed out!" 
  end #destroy
    
end #SessionsController


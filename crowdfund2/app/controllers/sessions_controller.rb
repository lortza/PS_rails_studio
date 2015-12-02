class SessionsController < ApplicationController
  def new
    #renders the New view
  end #new

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(session[:intended_url] || user) #sends user to the url where they were pre sign in OR ro the user page
      session[:intended_url] = nil #clears intended url
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end #if
  end #create

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been signed out" 
  end #destroy
    
    
end #SessionsController

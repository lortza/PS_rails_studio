class SessionsController < ApplicationController
  def new
  end #new

  def create
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:notice] = "Welcome back, #{user.name}!"
       redirect_to user
     else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
     end #if
   end #create
end #SessionsController

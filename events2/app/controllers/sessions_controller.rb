class SessionsController < ApplicationController

  def new
     #this simply renders the new view
  end #new

  def create
     params[:email]
     params[:password]
  end #create
      
end #SessionsController

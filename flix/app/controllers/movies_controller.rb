class MoviesController < ApplicationController
  def index
    #@movies = ["Captain Awesome Pants", "Traveling Pants", "How the Bear Stole my Heart", "SkelloCat: Conversations with Willow"] 
    @movies = Movie.all
    #@movies = Movie.limit(1)
  end #index

  def show
    @movie = Movie.find(params[:id]) 
  end #show

  def edit
    @movie = Movie.find(params[:id])  
  end #edit
    
    
    
end #MoviesController

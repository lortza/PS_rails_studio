class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end #index

  def show
    @movie = Movie.find(params[:id]) 
  end #show

  def edit
    @movie = Movie.find(params[:id]) 
  end #edit
    
    
    
end #MoviesController

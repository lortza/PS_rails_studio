class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end #index

  def show
    @movie = Movie.find(params[:id]) 
  end #show
    
    
end #MoviesController

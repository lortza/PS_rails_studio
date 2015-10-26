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

  def update
    @movie = Movie.find(params[:id]) 
    movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
    @movie.update(movie_params)
    redirect_to @movie

  end #update
    
    
    
end #MoviesController

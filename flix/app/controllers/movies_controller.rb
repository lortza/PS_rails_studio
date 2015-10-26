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
    @movie.update(movie_params)
    redirect_to @movie
  end #update

  def new # only need to create a new movie here
    @movie = Movie.new(params[:movie])
  end #new

  def create # need to save this movie into the DB
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to @movie
  end #create
    
  private
    def movie_params
        params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
    end #movie_params
          
    
    
end #MoviesController

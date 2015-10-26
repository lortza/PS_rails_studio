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

  def update
    @movie = Movie.find(params[:id]) 
    movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
    @movie.update(movie_params)
    redirect_to movie_url

  end #update


    # Never trust parameters from the scary internet, only allow the white list through.
    # def movie_params
    #   params.require(:movie).permit(:title, :description)
    # end #movie_params
    
    
end #MoviesController

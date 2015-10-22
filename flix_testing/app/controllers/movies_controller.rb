class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end #index
    
end #MoviesController

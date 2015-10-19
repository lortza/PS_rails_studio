class MoviesController < ApplicationController
  def index
    #@movies = ["Captain Awesome Pants", "Traveling Pants", "How the Bear Stole my Heart", "SkelloCat: Conversations with Willow"] 
    @movies = Movie.all
  end #index
    
end #MoviesController

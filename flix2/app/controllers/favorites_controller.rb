class FavoritesController < ApplicationController

  before_action :require_signin
  before_action :set_movie

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.favorites.create!(user: current_user)
    redirect_to @movie, notice: "Faved!"
  end #create

  def destroy
    @movie = Movie.find(params[:movie_id])
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to @movie, notice: "OH SNAP! Unfaved!"
  end #destroy

private
  
  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id]) 
  end #set_movie
    
    
end #FavoritesController

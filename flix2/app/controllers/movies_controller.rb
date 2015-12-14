class MoviesController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    case params[:filter]
    when "hits" then @movies = Movie.hits
    when "flops" then @movies = Movie.flops
    when "recent" then @movies = Movie.recent.limit(3)
    when "upcoming" then @movies = Movie.upcoming.limit(3)
    else @movies = Movie.released
    end #case
  end #index

  def show
    @reviews = @movie.reviews
    @fans = @movie.fans
    @genres = @movie.genres

    if current_user
      @current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end #if current_user
  end #show
  
  def edit
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end #if
  end #update

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end
  
  def destroy
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end
  
private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name, :slug, genre_ids: [])
  end #movie_params

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end #set_movie
end


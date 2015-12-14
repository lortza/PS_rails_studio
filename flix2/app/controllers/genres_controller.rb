class GenresController < ApplicationController
  
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end #index

  def show
     @movies = @genre.movies
  end #show
    
  def new
    @genre = Genre.new
  end #new

  def edit
  end #edit

  def update
    if @genre.update(genre_params)
      redirect_to genres_url, notice: "Success! #{@genre.name} has been updated"
    else
      render :edit
    end #if
  end #update
    
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    if @genre.save
      redirect_to genres_url, notice: "#{@genre.name} genre successfully added!"
    else
      render :new
    end 
  end #create
    
  def update
    if @genre.update(genre_params)
      redirect_to @genres_url, notice: "Genre successfully updated!"
    else
      render :edit
    end #if
  end #update

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_url, alert: "#{@genre.name} successfully deleted!"
  end
    
    
    

private
  
  def set_genre
    @genre = Genre.find_by!(slug: params[:id]) 
  end #set_genre
    

  def genre_params
    params.require(:genre).permit(:name, :slug) 
  end #genre_params

end #GenresController

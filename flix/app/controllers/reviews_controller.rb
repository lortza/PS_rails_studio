class ReviewsController < ApplicationController

    before_action :set_movie

    def index
        # @movie = Movie.find(params[:movie_id])
        @reviews = @movie.reviews 
    end #index

    def new #renders the form 
       # @movie = Movie.find(params[:movie_id])
       @review = @movie.reviews.new
    end #new

    def create #saves the contents of the rendered form
      @review = @movie.reviews.new(review_params)
        if @review.save #this implies "true"
          redirect_to movie_reviews_path(@movie), notice: "#{@review.name}'s review for #{@movie.title}' has been added."
        else
          render :new
        end #if
    end #create

    def edit
       
    end #edit
      
       

private
    def review_params
        params.require(:review).permit(:name, :stars, :comment, :city)
    end #review_params

    def set_movie
       @movie = Movie.find(params[:movie_id])
    end #set_movie
      

end #ReviewsController


    # t.string   "name"
    # t.integer  "stars"
    # t.text     "comment"
    # t.integer  "movie_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "city"
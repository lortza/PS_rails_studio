class ReviewsController < ApplicationController

    def index
        @movie = Movie.find(params[:movie_id])
        @reviews = @movie.reviews 
    end #index
      

private

  def review_params
    params.require(:review).permit(:name, :stars, :comment, :city)
  end #review_params
end #ReviewsController


    # t.string   "name"
    # t.integer  "stars"
    # t.text     "comment"
    # t.integer  "movie_id"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.string   "city"
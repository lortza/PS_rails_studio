module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
       "FLOP!"
    else
       number_to_currency(movie.total_gross)
    end #if
  end #format_gross

end #MoviesHelper

module MoviesHelper

  def format_total_gross(movie)
    if movie.flop?
       content_tag(:strong, "Flop!")
    else
       number_to_currency(movie.total_gross)
    end #if
  end #format_gross

end #MoviesHelper

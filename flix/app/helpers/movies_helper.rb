module MoviesHelper
 def format_total_gross(movie)
   if movie.flop?
    content_tag(:strong, 'Flop!')
   else
     number_to_currency(movie.total_gross)
   end #if
 end #format_total_gross
 
 def image_for(movie)
   if movie.image_file_name.blank?
     image_tag('placeholder.png')
   else
     image_tag(movie.image_file_name)
   end #if
 end #image_for

 def format_average_stars(movie)
   if movie.average_stars.nil?
    #content_tag(:strong, "No Reviews")
      image_tag("stars-none.jpg", class: "stars-img") 
    elsif movie.average_stars.round < 2
      image_tag("stars-1.jpg", class: "stars-img") 
    elsif movie.average_stars.round < 3
      image_tag("stars-2.jpg", class: "stars-img") 
    elsif movie.average_stars.round < 4
      image_tag("stars-3.jpg", class: "stars-img") 
    elsif movie.average_stars.round < 5
      image_tag("stars-4.jpg", class: "stars-img") 
    else
      image_tag("stars-5.jpg", class: "stars-img") 
      #"*" * movie.average_stars.round
      #pluralize(number_with_precision(movie.average_stars, precision: 2), "star")
    end 
 end #format_average_stars(movie)
   
end #MoviesHelper

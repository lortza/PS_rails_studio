class Movie < ActiveRecord::Base
  def flop?
    total_gross < 5000 
  end #flop?
    
end #Movie

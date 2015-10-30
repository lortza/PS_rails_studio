class Movie < ActiveRecord::Base
  def flop?
    total_gross < 50000000 
  end #flop?

  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end #self.released

  def self.hits # Sample: Filter by Hit Movies
    where("total_gross >= 300000000").order("total_gross desc")
  end #self.hits

  def self.flops #Sample: Filter by Flop Movies
    where("total_gross <= 50000000").order("total_gross asc")  
  end #self.flops

  def self.recently_added #Sample: Recently added movies
    limit(3).order("created_at desc") 
  end #self.recently_added
    
    
    
    
    
end #Movie

require 'spec_helper'

describe "Viewing an individual movie" do
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end #shows the movie's details
  
  it "shows the total gross if the total gross exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000))

    visit movie_url(movie)

    expect(page).to have_text("$60,000,000.00")
  end #shows the total gross

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 40000000))

    visit movie_url(movie)

    expect(page).to have_text("Flop!")
  end #shows 'Flop!'
  
  it "does not update the movie if it's invalid" do
    movie = Movie.create(movie_attributes)
    
    visit edit_movie_url(movie)
    
    fill_in 'Title', with: " "
    
    click_button 'Update Movie' 
        
    expect(page).to have_text('error')
  end #does not update the movie
end #describe
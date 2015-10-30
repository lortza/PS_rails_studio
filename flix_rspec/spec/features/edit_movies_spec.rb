#require 'spec_helper'

describe "Editing a movie" do
  
  it "displays an update form for the movie" do
    movie = Movie.create(movie_attributes)
    
    visit movie_url(movie)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_movie_path(movie))
        
    expect(find_field('Title').value).to eq(movie.title)
  end #it

  it "takes user-updated data, saves it, and redirects to an updated show page" do
    movie = Movie.create(movie_attributes)
    
    visit edit_movie_path(movie)

    fill_in 'Title', with: "Updated Movie Title"

    click_button 'Update Movie'

    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text('Updated Movie Title')
    
  end #it
  
end #describe
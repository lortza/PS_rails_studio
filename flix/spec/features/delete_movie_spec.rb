require 'spec_helper'

describe "Deleting a movie" do 
  it "destroys the movie and shows the movie listing without the deleted movie" do
    movie = Movie.create(movie_attributes)
    
    visit movie_path(movie)
    
    click_link 'Delete'
    
    expect(current_path).to eq(movies_path)
    expect(page).not_to have_text(movie.description)
  end #destroys

  it "shows confirmation message upon deletion" do
     movie = Movie.create(movie_attributes)
     visit movie_path(movie)
     click_link "Delete"
     expect(page).to have_text("deleted")
  end # shows confirmation message upon deletion
end
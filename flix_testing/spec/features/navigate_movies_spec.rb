describe "Navigating movies" do
    # nav from show to index
  it "links from the show page to the index page" do
    movie = Movie.create(movie_attributes) #is a method from the attributes file

    visit movie_url(movie) #testing happens on this page

    click_link "All Movies" #capybara clicking the link for us

    expect(current_path).to eq(movies_path)
  end #it do

  # nav from index to show
  it "links from the index page to each movie's show page" do
    movie = Movie.create(movie_attributes)

    visit movies_url(movie)

    click_link movie.title #capybara clicking the link for us

    expect(current_path).to eq(movie_path(movie))
  end #it do


end #describe
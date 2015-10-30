describe "A movie" do
  it "is a flop if the total gross < 50,000,000.00" do
    movie = Movie.new(total_gross: 4000.00)
    expect(movie.flop?).to eq (true)
  end #is a flop

  it "is is not a flop and shows the total gross if tg > $50M" do
    movie = Movie.new(total_gross: 100000000)
    expect(movie.flop?).to eq(false)
  end #not a flop

  it "is released when the released on date is in the past" do
    movie = Movie.create(movie_attributes(released_on: 3.months.ago))
    expect(Movie.released).to include(movie)
  end #is released

  it "is not released when the released on date is in the future" do
    movie = Movie.create(movie_attributes(released_on: 3.months.from_now))
    expect(Movie.released).not_to include(movie)
  end #is not released

  it "returns released movies ordered with the most recently-released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.months.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end #sort order
end #describe a movie
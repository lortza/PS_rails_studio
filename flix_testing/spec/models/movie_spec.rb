describe "A movie" do
  it "is a flop if the total gross < 50,000,000.00" do
    movie = Movie.new(total_gross: 4000.00)
    expect(movie.flop?).to eq (true)
  end #is a flop

  it "is is not a flop and shows the total gross if tg > $50M" do
    movie = Movie.new(total_gross: 100000000)
    expect(movie.flop?).to eq(false)
  end #not a flop
end #describe a movie
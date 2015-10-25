#require 'spec_helper'

describe "Viewing an individual movie" do
  it "shows each movie's details" do
    movie = Movie.create(title: "Iron Man",
                         rating: "PG-13",
                         total_gross: 318412101.00,
                         description: "Tony Stark builds an armored suit to fight the throes of evil",
                         released_on: "2008-05-02")

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
  end #it do

  it "shows the date in US formatting" do
    movie = Movie.create(movie_attributes(released_on: "02-05-2008"))
    visit movie_url(movie)
    expect(page).to have_text("May 2, 2008")

  end #us formatted date

  it "shows total gross if tg exceeds $50M" do
    movie = Movie.create(movie_attributes(total_gross: 60000000.00))
    visit movie_url(movie)
    expect(page).to have_text("$60,000,000.00")
  end #shows gross

  it "shows 'Flop!' if the tg is less than $50M" do
    movie = Movie.create(movie_attributes(total_gross: 600.00))
    visit movie_url(movie)
    expect(page).to have_text("Flop!")
  end #shows Flop

end #describe
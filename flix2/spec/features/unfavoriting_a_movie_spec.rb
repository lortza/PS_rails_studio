# add to new file spec/features/unfavoriting_a_movie_spec.rb

require 'spec_helper'

describe "Unfavoriting a movie" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "deletes the favorite and shows the Fave button" do
    movie = Movie.create!(movie_attributes)

    visit movie_url(movie)
    click_button 'Fave'

    expect(page).to have_text("1 Fan")

    expect {
      click_button 'UnFave'
    }.to change(@user.favorites, :count).by(-1)

    expect(current_path).to eq(movie_path(movie))

    expect(page).to have_text("Unfaved")
    #expect(page).to have_text("0 Fans")
    expect(page).to have_button("Fave")
  end
end #Unfavoriting a movie
require 'spec_helper'

describe "Viewing the list of users" do

  it "shows the users" do
    user1 = User.create!(user_attributes(name: "Larry", email: "larry@example.com", username: "larelare57"))
    user2 = User.create!(user_attributes(name: "Moe",   email: "moe@example.com", username: "memoo149"))
    user3 = User.create!(user_attributes(name: "Curly", email: "curly@example.com", username: "cadizcurlz"))

    visit users_url

    expect(page).to have_link(user1.name)
    expect(page).to have_link(user2.name)
    expect(page).to have_link(user3.name)
  end

end
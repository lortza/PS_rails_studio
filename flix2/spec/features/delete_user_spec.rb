# put this in the new file spec/features/delete_user_spec.rb

require 'spec_helper'

describe "Deleting a user" do
it "destroys the user and redirects to the home page" do
    user = User.create!(user_attributes)
    admin_user = User.create!(admin_user_attributes)

    sign_in(admin_user)
    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('deleted')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

    it "automatically signs out that user" do
    user = User.create!(user_attributes)
    admin_user = User.create!(admin_user_attributes)

    sign_in(admin_user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(page).to have_link('Sign In')
    expect(page).not_to have_link('Sign Out')
  end
  
end #Deleting a user
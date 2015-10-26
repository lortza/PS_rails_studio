#require 'spec_helper'

describe "Creating a new project" do
  it "saves the project and shows the new project's details" do
    visit projects_url

    click_link 'Add New Project'

    expect(current_path).to eq(new_project_path)

    fill_in "Name", with: "New Project Name"
    fill_in "Description", with: "Superheroes saving the world from villains"
    fill_in "Website", with: "www.website.com"
    fill_in "Target pledge amount", with: "75000000"
    fill_in "Pledging ends on", with: (Time.now.year - 1).to_s
    #select (Time.now.year - 1).to_s, :from => "pledging_ends_on_1i"

    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))

    expect(page).to have_text('New Project Name')
  end
end
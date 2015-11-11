require 'spec_helper'

describe "Deleting a project" do
  it "destroys the project and shows the project listing" do
    project = Project.create(project_attributes)

    visit project_path(project)

    click_link 'Delete'

    expect(current_path).to eq(projects_path)
    expect(page).not_to have_text(project.description)
  end #destroys

  it "shows a confirmation upon deletion" do
     project = Project.create(project_attributes)
     visit project_path(project)
     click_link "Delete"
     expect(page).to have_text("deleted")
  end # shows a confirmation upon deletion
end #describe

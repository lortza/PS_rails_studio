describe "Viewing an individual project" do

  it "shows each project's details" do
    project = Project.create(project_attributes) # links to attributes file

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project.pledging_ends_on)
    expect(page).to have_text(project.website)
  end #it do

end #describe

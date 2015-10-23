describe "Navigating projects" do

  it "links from the show page to the index page" do
    project = Project.create(project_attributes)

    visit project_url(project)

    click_link "All Projects"

    expect(current_path).to eq(projects_path)

  end #show to index

  it "links from the index page to the show page" do
    project = Project.create(project_attributes)
    
    visit projects_url(project)

    click_link project.name

    expect(current_path).to eq(project_path(project))

  end #index to show
    
end #describe
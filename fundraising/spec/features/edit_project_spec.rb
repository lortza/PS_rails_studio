describe "Editing a project" do

  it "provides an update form with all of the show page fields" do
    project = Project.create(project_attributes)
    
    visit project_url(project)
    
    click_link 'Edit'
    
    expect(current_path).to eq(edit_project_path(project))
        
    expect(find_field('Name').value).to eq(project.name)
    expect(find_field('Description').value).to eq(project.description)
    expect(find_field('Website').value).to eq(project.website)
    #expect(find_field('Pledging ends on').value).to eq(1.day.from_now)
    expect(find_field('Target pledge amount').value).to eq("100.0")

  end #it do

  it "accepts and saves user data input and redirects to the updated project show page" do
    project = Project.create(project_attributes)
    
    visit edit_project_path(project)
    
    fill_in 'Name', with: "Updated Project Name"

    click_button 'Update Project'

    expect(current_path).to eq(project_path(project))

    expect(page).to have_text('Updated Project Name')
  end #it do

end #describe
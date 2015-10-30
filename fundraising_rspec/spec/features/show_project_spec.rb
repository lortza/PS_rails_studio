describe "Viewing an individual project" do

  it "shows each project's details" do
    project = Project.create(project_attributes) # links to attributes file

    # projectA = Project.create(name: "Start-Up Project",
    #                         description: "A description of a start-up project",
    #                         target_pledge_amount: 100.00,
    #                         pledging_ends_on: 1.day.from_now,
    #                         website: "http://project-a.com")

    # projectB = Project.create(name: "Community Project",
    #                           description: "A description of a community project",
    #                           target_pledge_amount: 200.00,
    #                           pledging_ends_on: 1.day.ago,
    #                           website: "http://project-b.com")

    visit project_url(project)

    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project.pledging_ends_on)
    expect(page).to have_text(project.website)
    expect(page).to have_text(project.team_members)
    expect(page).to have_selector("img[src$='#{project.image_file_name}']")
  end #it do

  it "shows the number of days remaining if the pledging end date is in the future" do
      project = Project.create(project_attributes(pledging_ends_on: 1.day.from_now))
      visit project_url(project)
      expect(page).to have_text("1 Days Remaining")
  end #shows days remaining
  
  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 1.day.ago))
    visit project_url(project)
    expect(page).to have_text("All Done!")
  end #shows All Done!

end #describe

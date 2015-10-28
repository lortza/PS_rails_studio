def project_attributes(overrides = {})
  {
    name: "Spec Tester Project",
    description: "A description of a the spec tester project",
    target_pledge_amount: 100.00,
    pledging_ends_on: 1.day.from_now,
    website: "http://project-a.com",
    team_members: "Spec Team Awesome",
    image_file_name: "project.png"
  }.merge(overrides) 
end #project_attributes
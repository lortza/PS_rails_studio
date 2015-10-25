# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Project.create!([
  {
    name: "Personalized Robot Suits like Iron Man",
    website: "www.website.com",
    target_pledge_amount: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    pledging_ends_on: "2008-05-02"
  },
  {
    name: "Personal Flying Machine",
    website: "www.website.com",
    target_pledge_amount: 134218018.00,
    description: "Clark Kent grows up to be the greatest super-hero",
    pledging_ends_on: "1978-12-15"
  },
  {
    name: "Wall-Walking Gloves and Boots",
    website: "www.website.com",
    target_pledge_amount: 403706375.00,
    description: "Peter Parker gets bit by a genetically modified spider",
    pledging_ends_on: "2002-05-03"
  },
  {
    name: "Invisibility Cloak",
    website: "www.website.com",
    target_pledge_amount: 40200000.00,
    description: "Patience Philips has a more than respectable career as a graphic designer",
    pledging_ends_on: "2004-07-23"
  }
])
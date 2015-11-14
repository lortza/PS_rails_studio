# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create([
 {
   name: "Start-Up Project",
   description: "A description of a start-up project",
   target_pledge_amount: 100.00,
   pledging_ends_on: 1.day.from_now,
   website: "http://project-a.com",
   team_members: "Amber, John, Charles",
   image_file_name: "project-a.png"
 },
 {
   name: "Community Project",
   description: "A description of a community project",
   target_pledge_amount: 200.00,
   pledging_ends_on: 1.week.from_now,
   website: "http://project-b.com",
   team_members: "Diana, Jane, Joe",
   image_file_name: "project-b.png"
 },
{
   name: "Personal Project",
   description: "A description of a person project",
   target_pledge_amount: 300.00,
   pledging_ends_on: 1.month.from_now,
   website: "http://project-c.com",
   team_members: "Tom, Harry, Sally",
   image_file_name: "project-c.png"
 },
])

Pledge.create([
 {
   name: "Nooch",
   city: "Isla Mujeres",
   email: "nooch@kitties.com",
   amount: 200,
   comment: "I love this idea. I am sl gld you're doing it.",
   project_id: 1
 },
 {
   name: "Zorro",
   city: "New Orleans",
   email: "pinkcape@gmail.com",
   amount: 50,
   comment: "I don't know much, but I know I want this. I don't know what it is but I want it.",
   project_id: 1
 },
 {
   name: "Da PC",
   city: "NOLA", 
   email: "blank@email.com",
   amount: 200,
   comment: "Normally I'd just sit on the chair, but this seems like a better solution.",
   project_id: 2
 },
 {
   name: "Da Blanc",
   city: "Medellin",
   email: "pewpewpew@yahoo.com",
   amount: 100,
   comment: "You don't even know me. Really.",
   project_id: 2
 },
 {
   name: "Willow",
   city: "Skelleton Cushion, NOLA",
   email: "meoooooooow@email.com",
   amount: 100,
   comment: "Meoooooooooow. Rarrrrrrrrreeeeoooooow.",
   project_id: 3
 },
 {
   name: "Yowlanda",
   city: "Leon",
   email: "underdabed@hiding.com",
   amount: 50,
   comment: "If this means I get more fish scraps, I'm in.",
   project_id: 3
 }
])

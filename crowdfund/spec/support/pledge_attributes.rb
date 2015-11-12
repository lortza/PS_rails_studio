def pledge_attributes(overrides = {})
  {
    name: "John Smith",
    email: "johnsmith@email.com",
    comment: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
    amount: 100.00
  }.merge(overrides)
end #pledge_attributes

User.destroy_all
Event.destroy_all
ContiguousTiming.destroy_all
Shift.destroy_all
UsersShift.destroy_all

User.create({
  f_name: "Nicole",
  l_name: "Hemenway",
  email: "nicole.recallpresky@gmail.com",
  phone_number: "(650)714-5793",
  password: "asdfasdf"
})


Event.create({
   title: "Luna Park Chalk Art Festival",
   street_address1: "500 N. 13th St.",
   city: "San Jose"
})

ContiguousTiming.create({

})

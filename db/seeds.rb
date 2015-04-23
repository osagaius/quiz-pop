# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:  "testing",
  firstname: "Example",
  lastname: "User",
  email: "example@railstutorial.org",
  password:              "foobar88",
  password_confirmation: "foobar88")

99.times do |n|
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  username  = Faker::Internet.user_name(firstname)
  email = Faker::Internet.email(firstname)
  password = "password"
  User.create!(username:  username,
    firstname: firstname,
    lastname: lastname,
    email: email,
    password: password,
    password_confirmation: password)
end
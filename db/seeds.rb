# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Category.create!(title:  "Entertainment")
# Category.create!(title:  "Art")
# Category.create!(title:  "History")
# Category.create!(title:  "Science")
# Category.create!(title:  "Geography")
# Category.create!(title:  "Sports")

# Question.create!(difficulty: 2,
#   text: "What country is Iggy Azalea from?",
#   correct_answer: "Australia",
#   wrong_answer_1: "New Zealand",
#   wrong_answer_2: "Austria",
#   wrong_answer_3: "England",
#   category_id: 1)

# Question.create!(difficulty: 2,
#   text: "Who painted the Sistine Chapel?",
#   correct_answer: "Da Vinci",
#   wrong_answer_1: "De Vito",
#   wrong_answer_2: "Michaelangelo",
#   wrong_answer_3: "Raphael",
#   category_id: 2)

# Question.create!(difficulty: 1,
#   text: "Who is the current President?",
#   correct_answer: "Obama",
#   wrong_answer_1: "Biden",
#   wrong_answer_2: "Clinton",
#   wrong_answer_3: "Bush",
#   category_id: 3)

# Question.create!(difficulty: 1,
#   text: "What is Einstein's first name?",
#   correct_answer: "Albert",
#   wrong_answer_1: "Isaac",
#   wrong_answer_2: "James",
#   wrong_answer_3: "Ronald",
#   category_id: 4)

# Question.create!(difficulty: 1,
#   text: "What is the longest river in Africa?",
#   correct_answer: "Nile",
#   wrong_answer_1: "Congo",
#   wrong_answer_2: "Zambezi",
#   wrong_answer_3: "Niger",
#   category_id: 5)

# Question.create!(difficulty: 3,
#   text: "Who won the 2015 NBA Championship?",
#   correct_answer: "Golden State Warriors",
#   wrong_answer_1: "Los Angeles Lakers",
#   wrong_answer_2: "Cleveland Cavaliers",
#   wrong_answer_3: "New York Knicks",
#   category_id: 6)

# User.create!(username:  "testing",
#   firstname: "Example",
#   lastname: "User",
#   email: "example@railstutorial.org",
#   password:              "foobar88",
#   password_confirmation: "foobar88")

# 99.times do |n|
#   firstname = Faker::Name.first_name
#   lastname = Faker::Name.last_name
#   username  = Faker::Internet.user_name(firstname)
#   email = Faker::Internet.email(firstname)
#   password = "password"
#   User.create!(username:  username,
#     firstname: firstname,
#     lastname: lastname,
#     email: email,
#     password: password,
#     password_confirmation: password)
# end

Achievement.create!(title: "Registered")
Achievement.create!(title: "15 Questions")
Achievement.create!(title: "10 Correct")
Achievement.create!(title: "30 Correct")
Achievement.create!(title: "Won 1 Game")
Achievement.create!(title: "Won 10 Games")







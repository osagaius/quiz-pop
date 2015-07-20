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

Question.create!(difficulty: 3,
  text: "Who was the youngest member of Jackson 5?",
  correct_answer: "Michael",
  wrong_answer_1: "Tito",
  wrong_answer_2: "Alicia",
  wrong_answer_3: "Felicia",
  category_id: 1)

Question.create!(difficulty: 2,
  text: "What genre of music did the Beatles play?",
  correct_answer: "Rock",
  wrong_answer_1: "Pop",
  wrong_answer_2: "Rap",
  wrong_answer_3: "Metal",
  category_id: 1)

Question.create!(difficulty: 1,
  text: "Who painted the Mona Lisa?",
  correct_answer: "Da Vinci",
  wrong_answer_1: "Paul VII",
  wrong_answer_2: "Esposito",
  wrong_answer_3: "Raphael",
  category_id: 2)

Question.create!(difficulty: 1,
  text: "Where is the Louvre located?",
  correct_answer: "Paris, France",
  wrong_answer_1: "Stockholm, Sweden",
  wrong_answer_2: "New York, New York",
  wrong_answer_3: "Amsterdam, Netherlands",
  category_id: 2)

Question.create!(difficulty: 1,
  text: "Who was the first President of the USA?",
  correct_answer: "Washington",
  wrong_answer_1: "Obama",
  wrong_answer_2: "Adams",
  wrong_answer_3: "Franklin",
  category_id: 3)

Question.create!(difficulty: 3,
  text: "When did the American civil war end?",
  correct_answer: "1865",
  wrong_answer_1: "1787",
  wrong_answer_2: "1960",
  wrong_answer_3: "1861",
  category_id: 3)

Question.create!(difficulty: 1,
  text: "How many seconds are one hour?",
  correct_answer: "3600",
  wrong_answer_1: "4000",
  wrong_answer_2: "60",
  wrong_answer_3: "600",
  category_id: 4)

Question.create!(difficulty: 1,
  text: "What is the study of Plants?",
  correct_answer: "Botany",
  wrong_answer_1: "Agriculture",
  wrong_answer_2: "Plantiology",
  wrong_answer_3: "Etymology",
  category_id: 4)

Question.create!(difficulty: 1,
  text: "Whats the capital of Uruguay?",
  correct_answer: "Montevideo",
  wrong_answer_1: "Monticello",
  wrong_answer_2: "Paraguay",
  wrong_answer_3: "Lima",
  category_id: 5)

Question.create!(difficulty: 2,
  text: "What is the imaginary line that divides the Earth’s surface into the Northern and Southern Hemispheres?",
  correct_answer: "Equator",
  wrong_answer_1: "Hemispherical Divider",
  wrong_answer_2: "South Pole",
  wrong_answer_3: "Vertical Triangulator",
  category_id: 5)

Question.create!(difficulty: 3,
  text: "Whats the fastest swimming style?",
  correct_answer: "Front Crawl",
  wrong_answer_1: "Speed Stroke",
  wrong_answer_2: "Breast Stroke",
  wrong_answer_3: "Phelps Method",
  category_id: 6)

Question.create!(difficulty: 1,
  text: "Where is rugby originally from?",
  correct_answer: "England",
  wrong_answer_1: "Sudan",
  wrong_answer_2: "Peru",
  wrong_answer_3: "Bolivia",
  category_id: 6)

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


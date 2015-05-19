# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(title:  "Entertainment")
Category.create!(title:  "Art")
Category.create!(title:  "History")
Category.create!(title:  "Science")
Category.create!(title:  "Geography")
Category.create!(title:  "Sports")

Question.create!(difficulty: 1,
  text: "Who is the current President?",
  correct_answer: "Obama",
  wrong_answer_1: "Biden",
  wrong_answer_2: "Clinton",
  wrong_answer_3: "Bush",
  category_id: 3)
  
Question.create!(difficulty: 2,
  text: "What country is Iggy Azalea from?",
  correct_answer: "Australia",
  wrong_answer_1: "New Zealand",
  wrong_answer_2: "Austria",
  wrong_answer_3: "England",
  category_id: 1)

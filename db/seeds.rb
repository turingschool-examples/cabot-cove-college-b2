# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
resident1 = Resident.create!(name: "Jessica Rabbit", age: 68, occupation: "Singer")
resident2 = Resident.create!(name: "Seth Rogan", age: 43, occupation: "Comedian")
resident3 = Resident.create!(name: "Miles Morales", age: 18, occupation: "Student/Spiderman")
course1 = resident1.courses.create!(name: 'Geometry')
course2 = resident1.courses.create!(name: 'Intro to Humanology')
course3 = resident1.courses.create!(name: 'Study of Ant Anatomy: Antnatomy')
resident2.courses << course1
course4 = resident2.courses.create!(name: 'Intro to Psych(the show)')
course5 = resident2.courses.create!(name: 'Dog Whispering')

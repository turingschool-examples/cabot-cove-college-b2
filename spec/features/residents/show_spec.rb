require 'rails_helper'

RSpec.describe 'resident show page' do
  it "shows the resident's name and all their courses" do
    resident1 = Resident.create!(name: "Jessica Rabbit", age: 68, occupation: "Singer")
    resident2 = Resident.create!(name: "Seth Rogan", age: 43, occupation: "Comedian")
    course1 = resident1.courses.create!(name: 'Geometry')
    course2 = resident1.courses.create!(name: 'Intro to Humanology')
    course3 = resident1.courses.create!(name: 'Study of Ant Anatomy: Antnatomy')
    resident2.courses << course1
    course4 = resident2.courses.create!(name: 'Intro to Psych(the show)')
    course5 = resident2.courses.create!(name: 'Dog Whispering')

    visit "/residents/#{ resident1.id }"
    save_and_open_page

    expect(page).to have_content(resident1.name)
    expect(page).to have_content(course1.name)
    expect(page).to have_content(course2.name)
    expect(page).to have_content(course3.name)
    expect(page).to_not have_content(resident2.name)
    expect(page).to_not have_content(course4.name)
    expect(page).to_not have_content(course5.name)
  end
end
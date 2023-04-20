require 'rails_helper'
# User Story 2 of 4

# As a visitor,
# When I visit '/residents/:id'
# I see this resident's name
# And I see a list of this resident's courses.

# (e.g. "Jessica Fletcher
#       Courses:
#             - Crime Scenes 101"
#             - Fingerprinting")


RSpec.describe 'resident index' do
  describe 'as a visitor' do 
    before :each do
     @jess = Resident.create!(name: 'Jessica Fletcher', age: 35, occupation: 'Coder Vet Tech Badass')
     @jenn = Resident.create!(name: 'Jessica Fletcher', age: 35, occupation: 'Coder Vet Tech Badass')
     @crime = Course.create!(name: "Crime Scenes 101")
     @print = Course.create!(name: "Fingerprinting")
     @tox = Course.create!(name: "Toxicology")
     @course_1 = ResidentCourse.create!(resident_id: @jess.id, course_id: @crime.id)
     @course_2 = ResidentCourse.create!(resident_id: @jess.id, course_id: @print.id)
     @course_3 = ResidentCourse.create!(resident_id: @jenn.id, course_id: @tox.id)
     @course_4 = ResidentCourse.create!(resident_id: @jenn.id, course_id: @print.id)
    end
    it 'has a list of the residents courses' do 
        visit "/residents/#{@jess.id}"
        expect(page).to have_content(@crime.name)
        expect(page).to have_content(@print.name)
        
    end
    it 'has a unique list for each student' do 
        visit "/residents/#{@jenn.id}"
        expect(page).to have_content(@print.name)
        expect(page).to have_content(@tox.name)
    end
  end
end
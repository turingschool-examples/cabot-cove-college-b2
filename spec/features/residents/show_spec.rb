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
RSpec.describe 'resident show page' do
  describe 'As a visitor' do
    describe "When I visit '/residents/:id'" do
      before :each do
        @course_1 = Course.create!(name: 'Crime Scenes 101')
        @course_2 = Course.create!(name: 'Fingerprinting')

        @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
        @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')

        @res_1.courses.push(@course_1, @course_2)
        @course_1.residents.push(@res_2)
      end
      
      it "I see this resident's name and a list of this resident's courses" do
        visit "/residents/#{@res_1.id}"
        expect(page).to have_content(@res_1.name)
        expect(page).to have_content(@course_1.name)
        expect(page).to have_content(@course_2.name)
        
        visit "/residents/#{@res_2.id}"
        
        expect(page).to have_content(@res_2.name)
        expect(page).to have_content(@course_1.name)
        expect(page).to_not have_content(@course_2.name)
      end
    end
  end
end
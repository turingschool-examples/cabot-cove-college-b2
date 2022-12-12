require 'rails_helper'
# User Story 3 of 4
# As a visitor,
# When I visit '/courses'
# I see a list of courses and the number of residents enrolled in each course.

# (e.g. "Crime Scenes 101: 5"
#       "Fingerprinting: 10")
RSpec.describe 'courses index' do
  describe 'As a visitor' do
    describe "When I visit '/courses'" do
      before :each do
        @course_1 = Course.create!(name: 'Crime Scenes 101')
        @course_2 = Course.create!(name: 'Fingerprinting')
        @course_3 = Course.create!(name: 'Self Defense')

        @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
        @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
        @res_3 = Resident.create!(name: 'Jackson Pollock', age: 22, occupation: 'Painter')
        @res_4 = Resident.create!(name: 'Dean Winchester', age: 34, occupation: 'Hunter')
        @res_5 = Resident.create!(name: 'Wednesday Addams', age: 17, occupation: 'Student')
        @res_6 = Resident.create!(name: 'Carey Fisher', age: 54, occupation: 'Actor')
        @res_7 = Resident.create!(name: 'Christopher Waltz', age: 32, occupation: 'Librarian')
        @res_8 = Resident.create!(name: 'Mary Shelley', age: 60, occupation: 'Barista')

        @course_2.residents.push(@res_8, @res_3)
        @course_1.residents.push(@res_1, @res_2, @res_3, @res_4, @res_5, @res_6, @res_7, @res_8)
      end

      it 'I see a list of courses and the number of residents enrolled in each course' do
        visit '/courses'

        expect(page).to have_content("#{@course_1.name}: 8")
        expect(page).to have_content("#{@course_2.name}: 2")
        expect(page).to have_content("#{@course_3.name}: 0")
      end
    end
  end
end
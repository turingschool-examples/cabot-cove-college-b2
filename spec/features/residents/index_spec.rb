require 'rails_helper'
# User Story 1 of 4

# As a visitor,
# When I visit '/residents',
# I see a list of residents with the following information:
# - Name
# - Age
# - Occupation
# (e.g. "Name: Jessica Fletcher, Age: 65, Occupation: Mystery writer", 
#       "Name: Dr. Seth Hazlitt, Age: 70, Occupation: Town Doctor")


# User Story 4 of 4

# As a visitor,
# When I visit '/residents'
# I see the average age of all residents.

# (e.g. "Average Age: 72.5")

RSpec.describe 'residents index' do
  describe 'As a visitor' do
    describe "When I visit '/residents'" do
      before :each do
        @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
        @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
        @res_3 = Resident.create!(name: 'Jackson Pollock', age: 22, occupation: 'Painter')
        visit '/residents'
      end

      it 'I see a list of residents with their name, age, and occupation' do
        expect(page).to have_content("Name: #{@res_1.name}")
        expect(page).to have_content("Age: #{@res_1.age}")
        expect(page).to have_content("Occupation: #{@res_1.occupation}")
        expect(page).to have_content("Name: #{@res_2.name}")
        expect(page).to have_content("Age: #{@res_2.age}")
        expect(page).to have_content("Occupation: #{@res_2.occupation}")
        expect(page).to have_content("Name: #{@res_3.name}")
        expect(page).to have_content("Age: #{@res_3.age}")
        expect(page).to have_content("Occupation: #{@res_3.occupation}")
      end

      it 'I see the average age of all residents' do
        expect(page).to have_content('Average Age: 52.33')
      end
    end
  end
end
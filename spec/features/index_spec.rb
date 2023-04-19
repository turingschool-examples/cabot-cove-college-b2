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
RSpec.describe 'resident index' do
  describe 'as a visitor' do 
    before :each do
     @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
     @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
    end
     describe ' when I visit /residents' do 
      it ' I see a list of residents with their name, age, and occupation' do 

        visit '/residents'
        
        expect(page).to have_content("Residents Index")
        expect(page).to have_content("Jessica Fletcher")
        expect(page).to have_content(@res_2.name)
        expect(page).to have_content(@res_1.age)
        expect(page).to have_content(@res_2.age)
        expect(page).to have_content(@res_1.occupation)
        expect(page).to have_content(@res_2.occupation)
        save_and_open_page
      end
     end
   end
end




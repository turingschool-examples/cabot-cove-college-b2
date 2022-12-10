require 'rails_helper'

RSpec.describe 'resident index page' do
  it 'shows a list of residents with their name age and occupation' do
    resident1 = Resident.create!(name: "Jessica Rabbit", age: 68, occupation: "Singer")
    resident2 = Resident.create!(name: "Seth Rogan", age: 43, occupation: "Comedian")
    resident3 = Resident.create!(name: "Miles Morales", age: 18, occupation: "Student/Spiderman")

    visit '/residents'

    expect(page).to have_content("Name: Jessica Rabbit")
    expect(page).to have_content("Name: Seth Rogan")
    expect(page).to have_content("Age: 43")
    expect(page).to have_content("Age: 18")
    expect(page).to have_content("Occupation: Student/Spiderman")
    expect(page).to have_content("Occupation: Singer")   
  end
end
require 'rails_helper'

RSpec.describe Resident, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :occupation}
  end

  describe 'relationships' do
    it {should have_many :resident_courses}
    it {should have_many(:courses).through(:resident_courses)}
  end
  
  describe 'class methods' do
    describe '#resident_average_age' do
      before :each do
        @res_1 = Resident.create!(name: 'Jessica Fletcher', age: 65, occupation: 'Mystery writer')
        @res_2 = Resident.create!(name: 'Dr. Seth Hazlitt', age: 70, occupation: 'Town Doctor')
        @res_3 = Resident.create!(name: 'Jackson Pollock', age: 22, occupation: 'Painter')
      end
      it 'returns the average age of all residents' do
        expect(Resident.resident_average_age.round(2)).to eq(52.33)
      end
    end
  end

end

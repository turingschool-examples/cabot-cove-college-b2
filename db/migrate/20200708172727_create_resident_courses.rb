class CreateResidentCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :resident_courses do |t|
      t.references :resident, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

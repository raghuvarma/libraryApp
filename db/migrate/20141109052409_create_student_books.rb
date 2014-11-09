class CreateStudentBooks < ActiveRecord::Migration
  def change
    create_table :student_books do |t|
      t.integer :student_id
      t.integer :book_id

      t.timestamps
    end
  end
end

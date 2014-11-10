class Student < ActiveRecord::Base

	has_many :student_books
	has_many :books, through: :student_books

	validates_presence_of :name

end

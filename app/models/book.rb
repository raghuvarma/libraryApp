class Book < ActiveRecord::Base

	has_many :student_books
	has_many :students, through => :student_books
	
end

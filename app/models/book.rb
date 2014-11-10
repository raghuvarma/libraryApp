class Book < ActiveRecord::Base

	has_many :student_books
	has_many :students, through: :student_books

	validates_presence_of :name, :no_of_copies, :available, :on => :create 
	validates_inclusion_of :no_of_copies, :in => 1..10, :message => "is not included in the list 1..10", :on => :create
	
end

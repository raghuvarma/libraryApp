class BookManagementsController < ApplicationController

	def index
		@student_books = StudentBook.order("created_at desc").all
		@student_name = Student.find(@student_book.student_id)
		@book_name = Book.find(@student_book.book_id)
	end

	def new
		@student_book = StudentBook.new
	end

	def create
		@student_book = StudentBook.new(student_book)
 
	  @student_book.save
	  redirect_to book_managements_path

	end

	def show
		@student_book = StudentBook.find(params[:id])
		@student_name = Student.find(@student_book.student_id)
		@book_name = Book.find(@student_book.book_id)
	end

	def edit
		@student_book = StudentBook.find(params[:id])
	end

	def update
	  @student_book = StudentBook.find(params[:id])
	 
	  if @student_book.update(student_book)
	    redirect_to @book_management
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @student_book = StudentBook.find(params[:id])
	  @student_book.destroy
	 
	  redirect_to book_managements_path
	end

	private
  def student_book
    params.require(:student_book).permit(:student_id, :book_id)
  end
end

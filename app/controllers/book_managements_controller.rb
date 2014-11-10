class BookManagementsController < ApplicationController

	def index
		@student_books = StudentBook.order("created_at desc").all
	end

	def new
		@student_book = StudentBook.new
	end

	def create
		@student_book = StudentBook.new(student_book)
 
	  if @student_book.save
		  book = Book.find(@student_book.book_id)
		  current_books = book.no_of_copies
		  if(current_books > 1)
		  	book.update(:no_of_copies => current_books-1)
		  else
		  	book.update(:no_of_copies => current_books-1, :available => false)
		  end

		  redirect_to book_managements_path
		else
			render "new"
		end

	end

	def show
		@student_book = StudentBook.find(params[:id])
	end

	def edit
		@student_book = StudentBook.find(params[:id])
	end

	def update
	  @student_book = StudentBook.find(params[:id])
	 
	  if @student_book.update(student_book)
	  	book = Book.find(@student_book.book_id)
	  	current_books = book.no_of_copies
	  if(current_books > 1)
	  	book.update(:no_of_copies => current_books-1)
	  else
	  	book.update(:no_of_copies => current_books-1, :available => false)
	  end
	  
	    redirect_to book_managements_path
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

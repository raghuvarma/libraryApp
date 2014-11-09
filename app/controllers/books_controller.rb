class BooksController < ApplicationController

	def index
		@books = Book.all 
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
 
	  @book.save
	  redirect_to @book

	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
	  @book = Book.find(params[:id])
	 
	  if @book.update(book_params)
	    redirect_to @book
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @book = Book.find(params[:id])
	  @book.destroy
	 
	  redirect_to books_path
	end

	private
  def book_params
    params.require(:book).permit(:name, :author, :no_of_copies, :available)
  end

end
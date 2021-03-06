class StudentsController < ApplicationController

	def index
		@students = Student.all 
		@students = @students.paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
 
	  if @student.save
	  redirect_to @student
	  else
			render "new"
		end

	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
	  @student = Student.find(params[:id])
	 
	  if @student.update(student_params)
	    redirect_to @student
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @student = Student.find(params[:id])
	  @student.destroy
	 
	  redirect_to students_path
	end

	private
  def student_params
    params.require(:student).permit(:name)
  end



end

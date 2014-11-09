class StudentsController < ApplicationController

	def new

	end

	def create
		@student = Student.new(student_params)
 
	  @student.save
	  redirect_to @student

	end

	private
  def student_params
    params.require(:student).permit(:name)
  end

end

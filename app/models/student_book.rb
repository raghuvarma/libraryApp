class StudentBook < ActiveRecord::Base
	belongs_to :student
	belongs_to :book

	validates_presence_of :student_id, :book_id

	def overdue
		a = created_at.strftime("%d-%m-%y").to_i+10
		b= Time.now.strftime("%d-%m-%y").to_i
		(a-b).to_i
	end

	def overduedate
		updated_at.localtime+10.days
	end

	def daystoleft
		
		due_calculation

		if(@o <= 1 )			
			@o.abs.to_s+" Days"
		else
			""
		end
	end

	def overduecompleted

		due_calculation

		@o = @o.to_s
		if(@o > "2" )
			@o+" Days"
		elsif (@o == "1")
			@o+" Day"
		else
			""
		end
			
	end

	private
		def due_calculation
			a = updated_at.localtime+10.days
			b =Time.now.localtime

			v = a-b

			@o = v/(60*60*24)

			@o = @o.to_i

		end

end

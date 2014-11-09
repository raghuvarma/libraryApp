class StudentBook < ActiveRecord::Base
	belongs_to :student
	belongs_to :book

	def overdue
		a = created_at.strftime("%d-%m-%y").to_i+10
		b= Time.now.strftime("%d-%m-%y").to_i
		(a-b).to_i
	end	

end

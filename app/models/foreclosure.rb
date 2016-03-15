class Foreclosure < ActiveRecord::Base
	has_many :program_employees, as: :programable
	belongs_to :client


	def counselor?
		if program_employees[0].user.blank?
			"Not yet assigned."
		else 
			program_employees[0].user
		end
	end

	def column_count
		attributes.length - 3
		# Subtracting 3 from the column count to account for the columns id, updated at, and created at, which were filled automatically and not by the client.

	end

	def filled_columns
    filled_count = 0
    attributes.each do |k, v|
      if v != nil
        filled_count+=1
      end
    end
    filled_count - 3
  end
	
end

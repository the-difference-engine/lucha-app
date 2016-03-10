class Foreclosure < ActiveRecord::Base
	has_many :program_employees, as: :programable
	belongs_to :client

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |foreclosure|
	      csv << foreclosure.client.attributes.values_at(*column_names)
	    end
		end
	end

	def foreclosure_counselor
		if program_employees[0].user.blank?
			"Not yet assigned."
		else 
			program_employees[0].user
		end
	end

	def column_count

		
	end
	
end

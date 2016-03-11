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

	def counselor?
		if program_employees[0].user.blank?
			"Not yet assigned."
		else 
			program_employees[0].user
		end
	end

	def column_count
		# Similar to model method in client.rb
    filled_count = 0
    attributes.each do |k, v|
      if v != nil
        filled_count+=1
      end
    end
    filled_count - 3
    # Subtracting 2 from the filled_count variable to account for the columns id, updated at, and created at, which were filled automatically and not by the client.
  end
	
end

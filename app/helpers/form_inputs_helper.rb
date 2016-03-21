module FormInputsHelper

# Helper for Client update and create forms

	def education
		[
			["No High School Diploma", "No High School Diploma"],
			["High School Diploma", "High School Diploma"],
			["GED", "GED"],
			["Vocational Certificate", "Vocational Certificate"],
			["Some College/Never Completed", "Some College/Never Completed"],
			["Associates Degree", "Associates Degree"],
			["Bachelor's Degree", "Bachelor's Degree"],
			["Master's Degree", "Master's Degree"],
			["Doctoral Degree", "Doctoral Degree"]
		]
	end

	def pref_language
		[['English', 'English'], ['Spanish', 'Spanish'], ['Polish', 'Polish']]
	end

	def pref_contact
		[['Home Phone', 'Home Phone'], 
		['Cell Phone', 'Cell Phone'], 
		['Email', 'Email']]
		
	end

	def income_range
		# This helper was originally intended for the estimated_household_income model for the Client model. However, I changed that attribute to be a decimal for the purposes of reporting and data collection.
		# The client may want to change back to a range instead of an decimal, in which case, use this helper
		[
			["$15,000 or Less", "$15,000 or Less"],
			["$15,001–$20,000", "$15,001–$20,000"],
			["$20,001—$25,000", "$20,001—$25,000"],
			["$25,001—$30,000", "$25,001—$30,000"],
			["$30,001—$35,000", "$30,001—$35,000"],
			["$35,001—$40,000", "$35,001—$40,000"],
			["$40,001—$45,000", "$40,001—$45,000"],
			["$45,001—$50,000", "$45,001—$50,000"],
			["$50,001—$55,000", "$50,001—$55,000"],
			["$35,001—$40,000", "$35,001—$40,000"],
			["$40,001—$45,000", "$40,001—$45,000"],
			["$45,001—$50,000", "$45,001—$50,000"],
			["$50,001—$55,000", "$50,001—$55,000"],
			["$55,001—$60,000", "$55,001—$60,000"],
			["$60,001—$65,000", "$60,001—$65,000"],
			["$65,000+", "$65,000+"]
		]
	end

	def racial_options
		[['White', 'white'], ['Hispanic', 'Hispanic'], ['African-American', 'African-American'], ['Asian', 'Asian']]
	end

# Helper for Foreclosure update and create forms

	def cause_for_default
		# Helper for reason_for_default attribute in Foreclosure model
		[
			["Reduction in Income", "Reduction in Income"],
			["Divorce/Separation", "Divorce/Separation"],
			["Loss of Income", "Loss of Income"],
			["Medical Issues", "Medical Issues"],
			["Business Venture Failed", "Business Venture Failed"],
			["Increase in Loan Payment", "Increase in Loan Payment"],
			["Poor Budgeting", "Poor Budgeting"],
			["Increase in Expenses", "Increase in Expenses"],
			["Death of Family Member", "Death of Family Member"],
			["Other", "Other"]
		]	
	end


# Helper for Homebuying update and create forms

	def loan_type
		[
			["Fixed", "Fixed"],
			["Adjustable", "Adjustable"],
			["FHA", "FHA"],
			["Interest Only", "Interest Only"],
			["Conventional", "Conventional"],
			["VA", "VA"],
			["ARM", "ARM"],
			["Hybrid ARM", "Hybrid ARM"]
		]
	end

	def down_payment_assistance_program
		[
			["DDP", "DDP"],
			["IHDA", "IHDA"],
			["CCLT", "CCLT"],
			["Home Steps", "Home Steps"],
			["New Homes for Chicago", "New Homes for Chicago"],
			["Inclusive Community", "Inclusive Community"],
			["Chicago NSP", "Chicago NSP"],
			["City Lots for City Living", "City Lots for City Living"],
			["Other", "Other"]
		]
	end


end
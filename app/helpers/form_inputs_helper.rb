
module FormInputsHelper

# Helper for Client update and create forms

def employee_address
	[
		['3541 W. North Ave. #1, Chicago, IL 60647'],
		['Other LUCHA Address']
	]
end

def education
	[
		['No High School Diploma', 'No High School Diploma'],
		['High School Diploma', 'High School Diploma'],
		['GED', 'GED'],
		['Vocational Certificate', 'Vocational Certificate'],
		['Some College/Never Completed', 'Some College/Never Completed'],
		['Associates Degree', 'Associates Degree'],
		["Bachelor's Degree", "Bachelor's Degree"],
		["Master's Degree", "Master's Degree"],
		['Doctoral Degree', 'Doctoral Degree']
	]
end

def pref_language
	[
		['English', 'English'], 
		['Spanish', 'Spanish'], 
		['Polish', 'Polish'],
		['Other', 'Other']
	]
end

def pref_contact
	[
		['Home Phone', 'Home Phone'],
		['Cell Phone', 'Cell Phone'],
		['Email', 'Email']
	]
end

def marital_status
	[
		['Married', 'married'],
		['Separated', 'separated'],
		['Divorced', 'divorced'],
		['Single', 'single']
	]
end

def income_range
	# This helper was originally intended for the estimated_household_income model for the Client model. However, I changed that attribute to be a decimal for the purposes of reporting and data collection.
	# The client may want to change back to a range instead of an decimal, in which case, use this helper
	[
		['$15,000 or Less', '$15,000 or Less'],
		['$15,001–$20,000', '$15,001–$20,000'],
		['$20,001—$25,000', '$20,001—$25,000'],
		['$25,001—$30,000', '$25,001—$30,000'],
		['$30,001—$35,000', '$30,001—$35,000'],
		['$35,001—$40,000', '$35,001—$40,000'],
		['$40,001—$45,000', '$40,001—$45,000'],
		['$45,001—$50,000', '$45,001—$50,000'],
		['$50,001—$55,000', '$50,001—$55,000'],
		['$35,001—$40,000', '$35,001—$40,000'],
		['$40,001—$45,000', '$40,001—$45,000'],
		['$45,001—$50,000', '$45,001—$50,000'],
		['$50,001—$55,000', '$50,001—$55,000'],
		['$55,001—$60,000', '$55,001—$60,000'],
		['$60,001—$65,000', '$60,001—$65,000'],
		['$65,000+', '$65,000+']
	]
end

def racial_options
	[
		['White', 'White'],
		['Hispanic/Latino', 'Hispanic/Latino'],
		['African-American', 'African-American'],
		['Asian', 'Asian']
	]
end

def num_in_house
	[
		[1, 1],
		[2, 2],
		[3, 3],
		[4, 4],
		[5, 5],
		[6, 6],
		[7, 7],
		[8, 8],
		[9, 9]
	]
end

# Helper for Foreclosure update and create forms

def foreclosure_status
	[
		['I am not yet behind on my mortgage but close to it', 'I am not yet behind on my mortgage but close to it'],
		['Have not yet gone through the process, but am behind on payment', 'Have not yet gone through the process, but am behind on payment'],
		['I am over three months behind', 'I am over three months behind'],
		['I am over three months behind and have received a court summons', 'I am over three months behind and have received a court summons']
	]	
end


def cause_for_default
	# Helper for reason_for_default attribute in Foreclosure model
	[
		['Reduction in Income', 'Reduction in Income'],
		['Divorce/Separation', 'Divorce/Separation'],
		['Loss of Income', 'Loss of Income'],
		['Medical Issues', 'Medical Issues'],
		['Business Venture Failed', 'Business Venture Failed'],
		['Increase in Loan Payment', 'Increase in Loan Payment'],
		['Poor Budgeting', 'Poor Budgeting'],
		['Increase in Expenses', 'Increase in Expenses'],
		['Death of Family Member', 'Death of Family Member'],
		['Other', 'Other']
	]	
end

# Helper for Homebuying update and create forms

def learned_from
	[
		['A Friend', 'A Friend'],
		['Referred by my loan officer', 'Referred by my loan officer'],
		['Referred by my realtor', 'Referred by my realtor'],
		['Saw an ad in Hoy', 'Saw an ad in Hoy'],
		['Facebook', 'Facebook'],
		['Email blast', 'Email blast']
	]		
end

def loan_type
	[
		['Fixed', 'Fixed'],
		['Adjustable', 'Adjustable'],
		['FHA', 'FHA'],
		['Interest Only', 'Interest Only'],
		['Conventional', 'Conventional'],
		['VA', 'VA'],
		['ARM', 'ARM'],
		['Hybrid ARM', 'Hybrid ARM']
	]
end

def down_payment_assistance_program
	[
		['DDP', 'DDP'],
		['IHDA', 'IHDA'],
		['CCLT', 'CCLT'],
		['Home Steps', 'Home Steps'],
		['New Homes for Chicago', 'New Homes for Chicago'],
		['Inclusive Community', 'Inclusive Community'],
		['Chicago NSP', 'Chicago NSP'],
		['City Lots for City Living', 'City Lots for City Living'],
		['Other', 'Other']
	]
end

def gender_options
	[
		['Male', 'Male'],
		['Female', 'Female'],
		['Other', 'Other']
	]
end

def contact_method_options
	[
		['Email', 'Email'],
		['Cell Phone', 'Cell Phone'],
		['Home Phone', 'Home Phone'],
		['Work Phone', 'Work Phone']
	]
end

def marital_status_options
	[
		['Married', 'Married'],
		['Divorced', 'Divorced'],
		['Separated', 'Separated'],
		['Single', 'Single'],
		['Widowed', 'Widowed']

	]
end

def bedrooms
	[
		['Studio', 'Studio'],
		['1', '1'],
		['2', '2'],
		['3', '3']
	]
end

end
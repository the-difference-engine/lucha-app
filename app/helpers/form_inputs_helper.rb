
module FormInputsHelper

# Helper for Client update and create forms

def employee_address
	[
		['3541 W. North Ave. #1, Chicago, IL 60647'],
		['Other LUCHA Address']
	]
end

def education
	if I18n.locale != I18n.default_locale
		[
			['Sin Diploma de Escuela Secundaria', 'No High School Diploma'],
			['Diploma de Escuela Secundaria', 'High School Diploma'],
			['GED', 'GED'],
			['Certificado Vocacional', 'Vocational Certificate'],
			['Algún Colegio / Nunca Terminado', 'Some College/Never Completed'],
			['Grado Asociado', 'Associates Degree'],
			["Licenciatura", "Bachelor's Degree"],
			["Maestría", "Master's Degree"],
			['Doctorado', 'Doctoral Degree']
		]
	else
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
end

def pref_language
  if I18n.locale != I18n.default_locale
    [%w[Inglés English], %w[Español Spanish], %w[Polaco Polish], %w[Otro Other]]
  else
    [%w[English English], %w[Spanish Spanish], %w[Polish Polish], %w[Other Other]]
  end
end

def pref_contact
	if I18n.locale != I18n.default_locale
	  [["Número de Teléfono de Casa", "Home Phone"], [ "Teléfono Móvil", "Cell Phone"], ["Correo Electrónico", "Email"]]
	else
	  [["Home Phone", "Home Phone"], ["Cell Phone", "Cell Phone"], ["Email", "Email"]]
	end
end

def marital_status
	if I18n.locale != I18n.default_locale
		[
			['Casado', 'Married'],
			['Apartado', 'Separated'],
			['Divorciado', 'Divorced'],
			['Soltero', 'Single'],
			['Viudo', 'Widowed']
		]
	else
		[
			['Married', 'Married'],
			['Separated', 'Separated'],
			['Divorced', 'Divorced'],
			['Single', 'Single'],
			['Widowed', 'Widowed']
		]
	end
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
	if I18n.locale != I18n.default_locale 
		[
			['Blanco', 'White'],
			['Hispano / Latino', 'Hispanic/Latino'],
			['Afroamericano', 'African-American'],
			['Asiático', 'Asian']
		]
	else
		[
			['White', 'White'],
			['Hispanic/Latino', 'Hispanic/Latino'],
			['African-American', 'African-American'],
			['Asian', 'Asian']
		]
	end
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
	if I18n.locale != I18n.default_locale
		[
			['Todavía no estoy atrasado en mi hipoteca pero cerca de ella', 'I am not yet behind on my mortgage but close to it'],
			['Todavía no he pasado por el proceso, pero estoy atrasado en el pago', 'Have not yet gone through the process, but am behind on payment'],
			['Estoy más de tres meses atras', 'I am over three months behind'],
			['Estoy más de tres meses atrasado y he recibido una citación judicial', 'I am over three months behind and have received a court summons']
		]
	else
		[
			['I am not yet behind on my mortgage but close to it', 'I am not yet behind on my mortgage but close to it'],
			['Have not yet gone through the process, but am behind on payment', 'Have not yet gone through the process, but am behind on payment'],
			['I am over three months behind', 'I am over three months behind'],
			['I am over three months behind and have received a court summons', 'I am over three months behind and have received a court summons']
		]
	end	
end


# def cause_for_default
# This isn't currently being used
# 	# Helper for reason_for_default attribute in Foreclosure model
# 	[
# 		['Reduction in Income', 'Reduction in Income'],
# 		['Divorce/Separation', 'Divorce/Separation'],
# 		['Loss of Income', 'Loss of Income'],
# 		['Medical Issues', 'Medical Issues'],
# 		['Business Venture Failed', 'Business Venture Failed'],
# 		['Increase in Loan Payment', 'Increase in Loan Payment'],
# 		['Poor Budgeting', 'Poor Budgeting'],
# 		['Increase in Expenses', 'Increase in Expenses'],
# 		['Death of Family Member', 'Death of Family Member'],
# 		['Other', 'Other']
# 	]	
# end

# Helper for Homebuying update and create forms
# This isn't currently being used

# def learned_from
# 	[
# 		['A Friend', 'A Friend'],
# 		['Referred by my loan officer', 'Referred by my loan officer'],
# 		['Referred by my realtor', 'Referred by my realtor'],
# 		['Saw an ad in Hoy', 'Saw an ad in Hoy'],
# 		['Facebook', 'Facebook'],
# 		['Email blast', 'Email blast']
# 	]		
# end

# Homebuying app
def loan_type
	if I18n.locale != I18n.default_locale
		[
			['Fijo', 'Fixed'],
			['Ajustable', 'Adjustable'],
			['FHA', 'FHA'],
			['Único Interés', 'Interest Only'],
			['Convencional', 'Conventional'],
			['VA', 'VA'],
			['ARM', 'ARM'],
			['Híbrido ARM', 'Hybrid ARM']
		]
	else
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
end

def down_payment_assistance_program
	if I18n.locale != I18n.default_locale
		[
			['DDP', 'DDP'],
			['IHDA', 'IHDA'],
			['CCLT', 'CCLT'],
			['Inicio Pasos', 'Home Steps'],
			['Casas Nuevas para Chicago', 'New Homes for Chicago'],
			['Comunidad Inclusiva', 'Inclusive Community'],
			['Chicago NSP', 'Chicago NSP'],
			['City Lots para City Living', 'City Lots for City Living'],
			['Otro', 'Other']
		]
	else
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
end

def gender_options
	if I18n.locale != I18n.default_locale
		[
			['Masculino', 'Male'],
			['Hembra', 'Female'],
			['Otro', 'Other']
		]
	else
		[
			['Male', 'Male'],
			['Female', 'Female'],
			['Other', 'Other']
		]
	end
end

def contact_method_options
	if I18n.locale != I18n.default_locale
		 [["Número de Teléfono de Casa", "Home Phone"], [ "Teléfono Móvil", "Cell Phone"], ["Teléfono del Trabajo", "Work Phone"], ["Correo Electrónico", "Email"]]
	else
		 [["Home Phone", "Home Phone"], ["Cell Phone", "Cell Phone"], ["Work Phone", "Work Phone"], ["Email", "Email"]]
	end
end

def marital_status_options
	if I18n.locale != I18n.default_locale
		[
			['Casado', 'Married'],
			['Apartado', 'Separated'],
			['Divorciado', 'Divorced'],
			['Soltero', 'Single'],
			['Viudo', 'Widowed']
		]
	else
		[
			['Married', 'Married'],
			['Separated', 'Separated'],
			['Divorced', 'Divorced'],
			['Single', 'Single'],
			['Widowed', 'Widowed']
		]
	end
end

def bedrooms
	if I18n.locale != I18n.default_locale
		[
			['Estudio', 'Studio'],
			['1', '1'],
			['2', '2'],
			['3', '3']
		]
	else
		[
			['Studio', 'Studio'],
			['1', '1'],
			['2', '2'],
			['3', '3']
		]
	end
end

end
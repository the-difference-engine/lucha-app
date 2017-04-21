
module FormInputsHelper

# Helper for Client update and create forms

def employee_address
	[
		['3541 W. North Ave. #1, Chicago, IL 60647'],
		['1152 N Christiana Ave, Chicago, IL 60651']
	]
end

def education
	if I18n.locale != I18n.default_locale
		[
			['Sin Diploma de Escuela Secundaria', 'Sin Diploma de Escuela Secundaria'],
			['Diploma de Escuela Secundaria', 'Diploma de Escuela Secundaria'],
			['GED', 'GED'],
			['Certificado Vocacional', 'Certificado Vocacional'],
			['Algún Colegio / Nunca Terminado', 'Algún Colegio / Nunca Terminado'],
			['Grado Asociado', 'Grado Asociado'],
			["Licenciatura", "Licenciatura"],
			["Maestría", "Maestría"],
			['Doctorado', 'Doctorado']
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
    [%w[Inglés Inglés], %w[Español Español], %w[Polaco Polaco], %w[Otro Otro]]
  else
    [%w[English English], %w[Spanish Spanish], %w[Polish Polish], %w[Other Other]]
  end
end

def pref_contact
	if I18n.locale != I18n.default_locale
	  [["Número de Teléfono de Casa", "Número de Teléfono de Casa"], [ "Teléfono Móvil", "Teléfono Móvil"], ["Correo Electrónico", "Correo Electrónico"]]
	else
	  [["Home Phone", "Home Phone"], ["Cell Phone", "Cell Phone"], ["Email", "Email"]]
	end
end

def marital_status
	if I18n.locale != I18n.default_locale
		[
			['Casado', 'Casado'],
			['Apartado', 'Apartado'],
			['Divorciado', 'Divorciado'],
			['Soltero', 'Soltero'],
			['Viudo', 'Viudo']
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
	if I18n.locale != I18n.default_locale
		[
			['$15,000 o Menos', '$15,000 o Menos'],
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
	else
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
end

def racial_options
	if I18n.locale != I18n.default_locale 
		[
			['Blanco', 'Blanco'],
			['Hispano / Latino', 'Hispano / Latino'],
			['Afroamericano', 'Afroamericano'],
			['Asiático', 'Asiático']
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
			['Todavía no estoy atrasado en mi hipoteca pero cerca de ella', 'Todavía no estoy atrasado en mi hipoteca pero cerca de ella'],
			['Todavía no he pasado por el proceso, pero estoy atrasado en el pago', 'Todavía no he pasado por el proceso, pero estoy atrasado en el pago'],
			['Estoy más de tres meses atras', 'Estoy más de tres meses atras'],
			['Estoy más de tres meses atrasado y he recibido una citación judicial', 'Estoy más de tres meses atrasado y he recibido una citación judicial']
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
			['Fijo', 'Fijo'],
			['Ajustable', 'Ajustable'],
			['FHA', 'FHA'],
			['Único Interés', 'Único Interés'],
			['Convencional', 'Convencional'],
			['VA', 'VA'],
			['ARM', 'ARM'],
			['Híbrido ARM', 'Híbrido ARM']
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
			['Inicio Pasos', 'Inicio Pasos'],
			['Casas Nuevas para Chicago', 'Casas Nuevas para Chicago'],
			['Comunidad Inclusiva', 'Comunidad Inclusiva'],
			['Chicago NSP', 'Chicago NSP'],
			['City Lots para City Living', 'City Lots para City Living'],
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
			['Masculino', 'Masculino'],
			['Hembra', 'Hembra'],
			['Otro', 'Otro']
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
		 [
		 	["Número de Teléfono de Casa", "Número de Teléfono de Casa"], 
		 	["Teléfono Móvil", "Teléfono Móvil"], 
		 	["Teléfono del Trabajo", "Teléfono del Trabajo"], 
		 	["Correo Electrónico", "Correo Electrónico"]]
	else
		 [
	 		["Home Phone", "Home Phone"], 
		 	["Cell Phone", "Cell Phone"], 
		 	["Work Phone", "Work Phone"], 
		 	["Email", "Email"]
		]
	end
end

def marital_status_options
	if I18n.locale != I18n.default_locale
		[
			['Casado', 'Casado'],
			['Apartado', 'Apartado'],
			['Divorciado', 'Divorciado'],
			['Soltero', 'Soltero'],
			['Viudo', 'Viudo']
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
			['Estudio', 'Estudio'],
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
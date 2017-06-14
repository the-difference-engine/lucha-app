@language = ["English", "Spanish", "Polish"].sample
@random_boolean = [true, false].sample



10.times do
Client.create!(
	first_name: Faker::Name.first_name, 
	last_name: Faker::Name.last_name,
	race: "Hispanic",
	sex: "M",
	address: Faker::Address.street_address,
	city: "Chicago",
	state: "IL",
	ward: 26,
	zip_code: Faker::Address.zip_code,
	password: "password",
	home_phone: Faker::PhoneNumber.phone_number, 
 	work_phone: Faker::PhoneNumber.phone_number,
	cell_phone: Faker::PhoneNumber.phone_number,
	email: Faker::Internet.email
	# ssn: Faker::
	# preferred_contact_method: Faker::
	# preferred_language: @language
	# dob: Faker::
	# head_of_household: Faker::
	# num_in_household: Faker::
	# num_of_dependants: Faker::
	# education_level: Faker::
	# disability: Faker::
	# union_member: Faker::
	# military_service_member: Faker::
	# volunteer_interest: Faker::
	# estimated_household_income: Faker::
	# authorization_and_waiver: Faker::
	# privacy_policy_authorization: Faker::
	)

# ProgramEmployee.create!(
# 	user_id: ''
# 	)


User.create!(
	first_name: Faker::Name.first_name, 
	last_name: Faker::Name.last_name,
	password: "password",
	home_phone: Faker::PhoneNumber.phone_number, 
 	work_phone: Faker::PhoneNumber.phone_number,
	cell_phone: Faker::PhoneNumber.phone_number,
	permissions: 2,
	email: Faker::Internet.email
	)

Budget.create!(
	gross_wages: rand(100..900),
	self_employment_income: rand(100..900),
	overtime: rand(100..900),
	unemployment: rand(100..900),
	tips_commissions_bonus: rand(100..900),
	nontaxable_social_security: rand(100..900),
	taxable_social_security: rand(100..900),
	rental_income: rand(100..900),
	other_income: rand(100..900),
	primary_checking: rand(100..900),
	secondary_checking: rand(100..900),
	savings_money_market: rand(100..900),
	stocks_or_bonds: rand(100..900),
	four_zero_one_k: rand(100..900),
	home_equity: rand(100..900),
	other_property: rand(100..900),
	car: rand(100..900),
	other_assets: rand(100..900),
	principal_and_interest: rand(100..900),
	prop_tax: rand(100..900),
	assoc_fees: rand(100..900),
	junior_mortgage: rand(100..900),
	min_credit_card_payment: rand(100..900),
	student_loan: rand(100..900),
	gas: rand(100..900),
	electricity: rand(100..900),
	water: rand(100..900),
	phone: rand(100..900),
	other_utilities: rand(100..900),
	food: rand(100..900),
	gas_car_maintenance: rand(100..900),
	child_care: rand(100..900),
	medical_expenses: rand(100..900),
	rent: rand(100..900),
	rental_insurance: rand(100..900)
	# total_monthly_debt:  ,
	# gross_monthly_income: 
	# debt_divided_by_income: 
	)

Foreclosure.create!(
	currently_foreclosed: "Yes")

Homebuying.create!(
	lender: Faker::Company.name)

LawProject.create!(
	violation_type: Faker::Company.buzzword,
	current_evicted: @random_boolean,
	community_group: @random_boolean,
	tech_assistance: @random_boolean,
	frclsr_prevention: @random_boolean,
	low_income_family: @random_boolean,
	displacement: @random_boolean,
	substandard_housing: @random_boolean,
	disabilities: @random_boolean,
	lucha_tenant: @random_boolean,
	law_project_chargable: @random_boolean,
	other: Faker::Lorem.sentence,
	census_tract: Faker::Lorem.word,

	)

Rental.create!(
	# client_id: 
	evictions: rand(1..5), 
	waitlist_num: rand(1..100),
	studio: @random_boolean,
	two_bed: @random_boolean,
	three_bed: @random_boolean,
	wheelchair_accessible: @random_boolean,
	car_owner: @random_boolean,
	pet_owner: @random_boolean,
	kind_of_pet: Faker::Lorem.word,
	hear_of_property: Faker::Lorem.sentence,
	reasons_for_application: Faker::Lorem.sentence,
	landlord_name: Faker::Name.name,
	landlord_address: Faker::Address.street_address,
	landlord_phone: Faker::PhoneNumber.phone_number,
	occupancy_at_apartment: rand(1..4),
	monthly_rent: rand(500..1200),
	fuel_electric: rand(70..200),
	pre_landlord_name: Faker::Name.name,
	pre_landlord_address: Faker::Address.street_address,
	pre_landlord_phone: Faker::PhoneNumber.phone_number,
	pre_rent: rand(500..1200),
	pre_fuel_electric: rand(70..200),
	reason_for_move: Faker::Lorem.sentence,
	housing_situation: Faker::Lorem.sentence,
	employer_name: Faker::Company.name,
	employer_address: Faker::Address.street_address,
	employer_city: Faker::Address.city,
	employer_state: Faker::Address.state,
	employer_phone: Faker::PhoneNumber.phone_number,
	position: Faker::Company.buzzword,
	length_employed: rand(1..15),
	personal_reference_name: Faker::Name.name,
	per_ref_address: Faker::Address.street_address,
	per_ref_street: Faker::Address.street_name,
	per_ref_state: Faker::Address.state,
	per_ref_phone: Faker::PhoneNumber.phone_number,
	per_ref_relationship: Faker::Company.buzzword,
	displaced: Faker::Lorem.sentence,
	homeless: Faker::Lorem.sentence,
	over_fifty_percent: @random_boolean,
	agree_to_fee: @random_boolean

	)

SeniorRepair.create!(
	contractor: Faker::Company.name)

end
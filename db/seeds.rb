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
	)


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

ClientProgram.create(
	client_id: 2,
	programable_id: 1,
	programable_type: "Rental"
	)

Rental.create!(
	evictions: 2
	)

ProgramEmployee.create!(
	user_id: 2,
	programable_id: 1,
	programable_type: "Rental"
	)
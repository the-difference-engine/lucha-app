require 'rails_helper'

RSpec.describe Client, type: :model do

	describe '#column_count' do
		it 'should return the number of columns in the model' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			client.column_count
		expect(client.column_count).to eq(21)	
		end
	end

	describe '#filled_columns' do
		it 'should return the number of columns not blank' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			client.filled_columns
		expect(client.filled_columns).to eq(4)
		end
	end

	describe '#client_applications' do
		it 'should return an array of all the applications the client has started and/or submitted' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			foreclosure = Foreclosure.create(originating_lender: "Whomever it may be", client_id: client.id)
			homebuying = Homebuying.create(lender: "BOA", client_id: client.id)
			client.client_applications
		expect(client.client_applications.length).to eq(2)
		end
	end

	#  describe '#application_program_types' do
	#  	it 'should create a programable_employees instance with programable_id and programable_type for each item in the client_applications array' do
	#  		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
	# 		foreclosure = Foreclosure.create(originating_lender: "Whomever it may be", client_id: client.id)
	# 		homebuying = Homebuying.create(lender: "BOA", client_id: client.id)
	# 		client.application_program_types
	# 		expect(client.foreclosures[0].programable_employees).to eq("k")
	# 	end
	# end
	

end

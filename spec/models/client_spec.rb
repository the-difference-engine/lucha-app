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

	describe '#client_program_type' do
		it 'should return tell us what kind of application the client has completed' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			foreclosure = Foreclosure.create(originating_lender: "Whomever it may be", client_id: client.id)
			client.client_type
		expect(client.client_type).to eq("Foreclosures")
		end
	end


end

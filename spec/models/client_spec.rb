require 'rails_helper'

RSpec.describe Client, type: :model do


	describe '#full_name' do
		it 'should return the first and last name titleized' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			client.full_name
		expect(client.full_name).to eq("Bob Whatever")	
		end
	end

	describe '#column_count' do
		it 'should return the number of columns in the model that can be interacted with by the client' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			client.column_count
		expect(client.column_count).to eq(Client.columns.size - 4)	
		end
	end

	describe '#filled_columns' do
		it 'should return the number of columns which are interactable to the client that are not nil' do
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



end

require 'rails_helper'

RSpec.describe User, type: :model do

	describe '#full_name' do
		it 'should return the number of columns in the model' do
			client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			client.column_count
		expect(client.column_count).to eq(21)	
		end
	end

	describe '#cases' do
		it 'should return an array of clients currently assigned to the User' do
		end
	end



end

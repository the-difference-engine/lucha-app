require 'rails_helper'

RSpec.describe User, type: :model do

	describe '#full_name' do
		it 'should return the number of columns in the model' do
			user = User.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			user.full_name
		expect(user.full_name).to eq("Bob Whatever")	
		end
	end

	describe '#cases' do
		it 'should return an array of clients currently assigned to the User' do
		end
	end



end

require 'rails_helper'

RSpec.describe Foreclosure, type: :model do


	describe '#counselor?' do
		it 'should say there is a counselor' do
			foreclosure = Foreclosure.create(originating_lender: "Bank of America")
			employee = User.create(first_name: "Mark", last_name: "Wahlberg", email: "pop@gmail.com", password: "password")
			program_employee = ProgramEmployee.create(user_id: employee.id, programable_id: foreclosure.id, programable_type: "Foreclosure")		
		expect(foreclosure.counselor?.first_name).to eq("Mark")
		end
	end

	describe '#column_count' do
		it 'should return the number of columns in the model' do
			foreclosure = Foreclosure.create(originating_lender: "Bank of America")
			expect(foreclosure.column_count)
		end
	end

	describe '#filled_columns' do
		it 'should return the number of columns not blank' do
			foreclosure = Foreclosure.create(originating_lender: "Bank of America")
		expect(foreclosure.column_count).to eq(1)

		end
	end


end


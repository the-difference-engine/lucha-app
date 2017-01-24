# == Schema Information
#
# Table name: foreclosures
#
#  id                       :integer          not null, primary key
#  currently_foreclosed     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  client_id                :integer
#  originating_lender       :string
#  original_loan_number     :string
#  servicer                 :string
#  servicer_loan_number     :string
#  monthly_mortgage_payment :decimal(8, 2)
#  loan_term                :integer
#  origination_date         :date
#  been_to_court            :boolean
#  court_case_number        :string
#  working_with_lawyer      :boolean
#  working_w_agency         :boolean
#  agency                   :string
#  reason_for_default       :string
#

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
			expect(foreclosure.column_count).to eq(Foreclosure.columns.size - 3)
		end
	end

	describe '#filled_columns' do
		it 'should return the number of columns not blank' do
			foreclosure = Foreclosure.create(originating_lender: "Bank of America")
		expect(foreclosure.filled_columns).to eq(1)
		end
	end


end


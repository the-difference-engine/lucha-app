require 'rails_helper'
require 'spec_helper'

RSpec.describe Budget, type: :model do

		before(:each) do
			@budget = build(:budget, {total_monthly_debt: 10.0, gross_monthly_income: 2.0})
		end

		describe '#debt_income_ratio' do
			it 'returns quotient of budgets total monthly debt, and gross monthly income' do
				expect(@budget.debt_income_ratio).to eq(5.0)
			end
		end

		describe "validations" do
      it "is invalid without client" do
        @budget = build(:budget, {client: nil})
        @budget.valid?
        expect(@budget.errors.full_messages).to include("Client can't be blank")
      end
    end

end

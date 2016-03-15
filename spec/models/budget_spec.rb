require 'rails_helper'

RSpec.describe Budget, type: :model do


	describe 'budget instance' do
		it 'should create an instance of a budget' do
			budget = Budget.create
			expect(budget.blank?).to eq(false)
		end
	end

	describe '#column_count' do
		it 'should return the number of columns in the model' do
			budget = Budget.create
			expect(budget.column_count).to eq(Budget.columns.size - 3 )
		end
	end



end

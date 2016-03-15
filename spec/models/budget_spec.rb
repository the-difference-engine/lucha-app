require 'rails_helper'

RSpec.describe Budget, type: :model do

	describe '#column_count' do
		it 'should return the number of columns in the model' do
			foreclosure = Foreclosure.create(originating_lender: "Bank of America")
			expect(foreclosure.column_count)
		end
	end



end

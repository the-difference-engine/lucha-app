require 'rails_helper'

RSpec.describe HomebuyingsController, type: :controller do

	describe "index #GET" do
		it "assigns an array of Homebuyings" do
			homebuying1 = create(:homebuying)
			homebuying2 = create(:homebuying)
			homebuying3 = create(:homebuying)
			get :index
			expect(
				assigns(
					:homebuyings
				)
			).to match_array([homebuying1, homebuying2, homebuying3])
		end

		it "renders index template" do
      get :index
      expect(response).to render_template :index
		end

	end
end

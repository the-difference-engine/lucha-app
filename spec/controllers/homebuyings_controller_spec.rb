require 'rails_helper'

RSpec.describe HomebuyingsController, type: :controller do

	describe "index #GET" do
		it "assigns an array of Homebuying" do
			client = create(:client)
			p create(:homebuying, client_id: client.id)
		end
end

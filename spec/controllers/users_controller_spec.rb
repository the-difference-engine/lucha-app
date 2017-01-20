require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  describe "Get #index" do
    context 'signed in as a user' do
      it "populates an array of unassigned clients" do
        client1 = create(:client)
        client2 = create(:client)
        get :index
        expect(assigns(:clients)).to match_array([client1, client2])
      end
    end
  end
#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #show" do
#     it "returns http success" do
#       get :show
#       expect(response).to have_http_status(:success)
#     end
#   end






end

require 'rails_helper'


RSpec.describe ClientsController, type: :controller do
  include Devise::TestHelpers

  # before(:each) do
  #   @client = create(:client)
  # end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new client" do
        client = create(:client)
        clients = Client.all
        expect(clients.length).to eq(1)
        # expect{
        #   post :create, client: FactoryGirl.attributes_for(:client)
        # }.to change(Client, :count).by(1)
      end

      it "redirects to the new client" do
        # post :create, client: FactoryGirl.attributes_for(:client)
        # response.should redirect_to Client.last
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new client" do
    #     expect{
    #       post :create, client: FactoryGirl.attributes_for(:invalid_client)
    #     }.to_not change(Client,:count)
    #   end

    #   it "re-renders the new method" do
    #     post :create, client: FactoryGirl.attributes_for(:invalid_client)
    #     response.should render_template :new
    #   end
    # end 
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

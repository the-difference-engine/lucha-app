require 'rails_helper'

RSpec.describe BudgetsController, type: :controller do
  include Devise::TestHelpers
  # describe "GET #index" do
  #   before :each do
  #     request.env['devise.mapping'] = Devise.mappings[:user]
  #     login_with_client nil
  #   end

  #   it "returns http success" do
  #     # login_with_client create( :user)
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "PATCH #update" do
    before :each do
      @client = create(:client)
      @budget = create(:budget, client_id: @client.id)
    end
    it "locates the client's budget" do
      sign_in @client
      patch :update, id: @budget, income: { gross_wages: 50.00 }
      expect(assigns(:budget).gross_wages).to eq(50.00)
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

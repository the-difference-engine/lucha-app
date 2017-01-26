require 'rails_helper'

RSpec.describe Client::RegistrationsController, type: :controller do
  include Devise::TestHelpers

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:client]
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new client" do
        post :create, client: FactoryGirl.attributes_for(:client)
        clients = Client.all
        expect(clients.length).to eq(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new client" do
        post :create, client: FactoryGirl.attributes_for(:client, :invalid)
        clients = Client.all
        expect(clients.length).to eq(0)
      end
    end
  end
end

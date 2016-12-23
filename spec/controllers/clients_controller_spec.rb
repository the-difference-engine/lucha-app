require 'rails_helper'


RSpec.describe ClientsController, type: :controller do
  include Devise::TestHelpers

  # before(:each) do
  #   @client = create(:client)
  # end

  describe "PUT update" do
    context "updates with valid attributes" do
      
      it "updates an existing client" do
        login_with_client
        client = create(:client)
        params = {
          first_name: "Pete"
        }
        put :update, id: client.id, params
        client = Client.last

        expect(client.first_name).to eq("Pete")
      end

    end 
  end

 

  

end

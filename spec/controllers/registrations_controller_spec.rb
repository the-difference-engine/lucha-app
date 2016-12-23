require 'rails_helper'


RSpec.describe RegistrationsController, type: :controller do
  include Devise::TestHelpers

  # before(:each) do
  #   @client = create(:client)
  # end

  describe "POST create" do
    context "with valid attributes" do
      
      it "creates a new client" do
        
        params = {

        }
        post :create, params
        clients = Client.all
        expect(clients.length).to eq(1)
      end


   
    end 
  end



  def client_params
    {
      first_name: "Peter",
      last_name: "Parker",
      home_phone: "312-555-1212",
      cell_phone: "312-555-1213",
      work_phone: "312-555-1214",
      address: "123 Main Street",
      state: "IL",
      city: "Chicago",
      zip_code: "60657",
      ward: "19",
      

    }
  end

end

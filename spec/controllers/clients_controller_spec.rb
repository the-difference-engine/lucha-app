require 'rails_helper'
require 'spec_helper'

RSpec.describe ClientsController, type: :controller do
  include Devise::TestHelpers


  describe "POST #note_create" do

    xit "creates a new note for the client" do
      login_user
      client = create(:client)
      params = {
        description: "Test description",
        client_id: client.id
      }

      post :note_create, id: client.id, note: params
      note = Note.last

      expect(Note.all.size).to eq(1)
      expect(note.description).to eq("Test description")
      expect(response).to redirect_to client
      expect(subject.request.flash[:success].first).to eq("Note added.")
    end

  end

  describe "PATCH update" do
    # This is done by joy/nate
    before(:each) do
      @client = FactoryGirl.create(:client)
      sign_in @client
    end
    context "valid attributes" do
      it "locates the requested @client" do
        patch :update, id: @client.id, client: attributes_for(:client)
        expect(assigns(:client)).to eq(@client)
      end

      it "updates an existing client" do
        params = {
          first_name: "Test",
          last_name: "Name",
          email: "peterpan@example.com",
          password: "12345678",
          password_confirmation: "12345678",
          authorization_and_waiver: true,
          privacy_policy_authorization: true,
          ssn: "123121234",
          sex: 'male',
          race: 'white',
          education_level: 'education',
          estimated_household_income: 100000,
          preferred_contact_method: "312-555-1212",
          preferred_language: "English",
          marital_status: "Single",
          dob: 19940301,
          num_in_household: 3,
          num_of_dependants: 1
        }

        patch :update, id: @client.id, client: params
        updated_client = Client.find_by(email: "peterpan@example.com")

        expect(updated_client.first_name).to eq("Test")
        # expect(updated_client.last_name).to eq("Name")
        # expect(response).to redirect_to updated_client
        # expect(subject.request.flash[:success].first).to eq("Your info is updated.")
      end
    end
  end

  describe "GET #destroy" do
    xit "deletes a note" do
      login_user
      updated_client = create(:client,
                      user_id: subject.current_user.id)
      note = create(:note,
                    user_id: subject.current_user.id,
                    client_id: client.id)
      expect(Note.all.size).to eq(1)
      get :destroy, id: note.id
      expect(response).to redirect_to( client_path(client.id) )
      expect(Note.all.size).to eq(0)
      expect(subject.request.flash[:success].first).to eq("Note deleted.")
    end
  end

  describe "GET #assign" do
    before(:each) do
      @client = FactoryGirl.create(:client)
      sign_in @client
    end
    # this test is not done, I am not sure how you want this user experence to work, once you figure it out you can update the method and then test it.
    it "Assigns a client to a user" do
      # we want to assign a client id to a user
      # patch :assign, id: @client.id
      expect(response).to redirect_to(user_path(subject.current_user.id) )
      expect(subject.request.flash[:success].first).to eq("Employee Assigned")
    end
  end

end

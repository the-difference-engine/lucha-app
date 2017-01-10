require 'rails_helper'
require 'spec_helper'

RSpec.describe ClientsController, type: :controller do
  include Devise::TestHelpers

  # before(:each) do
    #since we have to test both current_user functionalty and current_client we can't use globals. this controller deals with two seperate users. Not good practice!
  # end

# testing note create action
  describe "POST #note_create" do

    it "creates a new note for the client" do

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



    context "valid attributes" do
      it "locates the requested @client" do
        client = FactoryGirl.create(:client)

        sign_in client
        p client
        patch :update, id: client.id, client: attributes_for(:client)
        expect(assigns(:client)).to eq(client)
      end
    end

      # it "updates an existing client" do
      #   # login_client
      #   params = {
      #     first_name: "Test",
      #     last_name: "Name",
      #     email: "peterpan@example.com",
      #     password: "12345678",
      #     password_confirmation: "12345678",
      #     authorization_and_waiver: true,
      #     privacy_policy_authorization: true,
      #     ssn: "123121234",
      #     sex: 'male',
      #     race: 'white',
      #     education_level: 'education',
      #     estimated_household_income: 100000,
      #     preferred_contact_method: "312-555-1212",
      #     preferred_language: "English",
      #     marital_status: "Single",
      #     dob: 19940301,
      #     num_in_household: 3,
      #     num_of_dependants: 1
      #   }

      #   put :update, id: subject.current_client.id, client: params
      #   client = Client.last

      #   expect(client.first_name).to eq("Test")
      #   # expect(client.last_name).to eq("Name")
      #   # expect(response).to redirect_to client
      #   # expect(subject.request.flash[:success].first).to eq("Your info is updated.")
      # end
  end

  describe "GET #destroy" do
    it "deletes a note" do
      login_user
      client = create(:client,
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
## this test is not done, I am not sure how you want this user experence to work, once you figure it out you can update the method and then test it.
    xit "Assigns a client to a user" do
      login_user
      client = create(:client)

      patch :assign, id: client.id
      expect(response).to redirect_to( user_path(subject.current_user.id) )
      expect(subject.request.flash[:success].first).to eq("Employee Assigned")
    end
  end

end

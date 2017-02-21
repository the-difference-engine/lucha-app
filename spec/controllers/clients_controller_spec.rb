require 'rails_helper'
require 'spec_helper'

RSpec.describe ClientsController, type: :controller do
  include Devise::TestHelpers


  # INDEX
  describe "index #GET" do
    it "assigns an array of @users" do
      @user = create(:user)
      sign_in @user
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      get :index
      expect(assigns(:users)).to match_array([
        @user,
        user1,
        user2,
        user3,
      ])
    end

    it "assigns an array of @clients" do
      @client = create(:client)
      sign_in @client
      client1 = create(:client)
      client2 = create(:client)
      client3 = create(:client)
      get :index
      expect(assigns(:clients)).to match_array([
        @client,
        client1,
        client2,
        client3,
      ])
    end

    it "assigns an array of @foreclosures" do
      @user = create(:user)
      sign_in @user
      @foreclosure = create(:foreclosure)
      foreclosure1 = create(:foreclosure)
      foreclosure2 = create(:foreclosure)
      foreclosure3 = create(:foreclosure)
      get :index
      expect(assigns(:foreclosures)).to match_array([
        @foreclosure,
        foreclosure1,
        foreclosure2,
        foreclosure3,
      ])
    end

    it "renders index template" do
      @user = create(:user)
      sign_in @user
      get :index
      expect(response).to render_template :index
    end

    # This is currently not working some research may be required
    xit "returns a CSV file" do
      @client = create(:client)
      get :index, format: :csv
      expect(response.header['Content-Type']).to include 'text/csv'
    end
  end

# testing note create action
  describe "POST #note_create" do

    it "creates a new note for the client" do
      login_user
      @client = create(:client)

      post :note_create, id: @client.id, description: "Test description"
      note = Note.last

      expect(Note.all.size).to eq(1)
      expect(note.description).to eq("Test description")
      expect(response).to redirect_to "/clients/#{@client.id}"
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
          num_of_dependants: 1,
          head_of_household: true,
          disability: true,
          union_member: true,
          military_service_member: true,
          volunteer_interest: true,
        }

        patch :update, id: @client.id, client: params
        @client.reload

        expect(@client.first_name).to eq("Test")
        # expect(updated_client.last_name).to eq("Name")
        # expect(response).to redirect_to updated_client
        # expect(subject.request.flash[:success].first).to eq("Your info is updated.")
      end
    end
  end

  describe "GET #destroy" do

    it "destroys a note for a user" do
      login_user
      client = create(:client)
      params = {
        description: "Test description",
        client_id: client.id
      }

      post :note_create, id: client.id, note: params
      note = Note.last

      expect(Note.all.size).to eq(1)
      get :destroy, id: note.id
      expect(response).to redirect_to( client_path(client.id) )
      expect(Note.all.size).to eq(0)
      expect(subject.request.flash[:success].first).to eq("Note deleted.")
    end

    it "does not destroy a note for a user" do
      login_user
      client = create(:client)
      params = {
        description: "Test description",
        client_id: client.id
      }
      post :note_create, id: client.id, note: params
      note = Note.last

      expect(Note.all.size).to eq(1)
      allow_any_instance_of(Note).to receive(:destroy).and_return(false)
      get :destroy, id: note.id
      expect(response).to redirect_to( client_path(client.id) )
      expect(Note.all.size).to eq(1)
      expect(subject.request.flash[:danger].first).to eq("Something went wrong note not deleted." )

    end
  end

  describe "GET #assign" do
    before(:each) do
      @user = create(:user)
      @client = create(:client)
      sign_in @user
    end
    it "Assigns a client to a user" do
      put :assign, id: @client.id, client: {user_id: @user.id}
      @client.reload
      expect(@client.user_id).to eq(@user.id)
    end
  end

end

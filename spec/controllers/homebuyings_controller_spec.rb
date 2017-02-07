require 'rails_helper'
require 'spec_helper'

RSpec.describe HomebuyingsController, type: :controller do

  include Devise::TestHelpers

  # INDEX
  describe "index #GET" do
    before :each do
      @client = create(:client)
      sign_in @client
    end
    it "assigns an array of Homebuyings" do
      homebuying1 = create(:homebuying)
      homebuying2 = create(:homebuying)
      homebuying3 = create(:homebuying)
      get :index
      expect(assigns(:homebuyings)).to match_array([
        homebuying1,
        homebuying2,
        homebuying3,
      ])
    end

    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  # NEW
  describe "new #GET" do
    before :each do
      @client = create(:client)
      sign_in @client
    end
    it "assigns a homebuying instance" do
      get :new
      expect(assigns(:homebuying)).to be_a_new(Homebuying)
    end

    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # CREATE
  describe "create #POST" do
    describe "properly assigns id based on users status" do
      before :each do
        @some_client = create(:client)
        @some_other_client = create(:client)
        @some_user = create(:user)
      end
      context "current_client logged in" do
        before :each do
          sign_in @some_client
        end
        it "assigns a client id based on client currently logged in" do
          post :create
          expect(assigns(:id)).to eq @some_client.id
        end
      end

      context "current_user logged in" do
        before :each do
          @some_client = create(:client)
          @some_user = create(:user)
          sign_in @some_client
          sign_in @some_user
        end
        it "assigns a user id based on client currently logged in" do
          post :create, id: @some_user.id
          expect(assigns(:id)).to eq @some_user.id
        end
      end
    end

    context "neither user or client logged in" do
      it "doesnt assign id if no user or client is logged in" do
        post :create
        expect(assigns(:id)).to eq nil
      end
    end

    describe "creates a new homebuying instance and assigns it to homebuying" do
      before :each do
        @some_client = create(:client)
        @some_other_client = create(:client)
        @some_user = create(:user)
        sign_in @some_client
        sign_in @some_user
      end
      it "assigns a homebuying instance" do
        post :create, attributes_for(:homebuying)
        expect(assigns(:homebuying)).to be_a_new(Homebuying)
      end
    end

    describe "it attempts to save the homebuying instance" do
      context "saves successfully" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
        end
        it "updates the flash hash with success message" do
          post :create, attributes_for(:homebuying)
          expect(flash[:success]).to be_present
        end
        it "redirects to the homebuying application page" do
          post :create, attributes_for(:homebuying)
          expect(response).to redirect_to("/homebuyings/#{@this_client.homebuying.id}")
        end
        it "saves a new homebuying to the database" do
          expect{
            post :create, attributes_for(:homebuying)
          }.to change(Homebuying, :count).by(1)
        end
      end

      context "fails to save" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
          allow_any_instance_of(Homebuying).to receive(:save).and_return(false)
          allow_any_instance_of(Homebuying).to receive_message_chain(:errors, :full_messages).and_return(["danger"])
        end
        it "updates the flash message to danger" do
          post :create, attributes_for(:homebuying)
          expect(flash[:warning]).to be_present
        end
        it "renders the NEW template" do
          post :create, attributes_for(:homebuying)
          expect(response).to render_template :new
        end
      end
    end
  end

  # SHOW
  describe "show #GET" do
    before :each do
      @client = create(:client)
      sign_in @client
      @this_homebuying = create(:homebuying, client_id: @client.id)
      @user = create(:user)
      sign_in @user
    end
    it "assigns a homebuying instance" do
      get :show, id: @client.homebuying.id
      expect(assigns(:homebuying)).to eq(@this_homebuying)
    end

    it "renders new template" do
      get :show, id: @this_homebuying
      expect(response).to render_template :show
    end
  end

  # EDIT
  describe "edit #GET" do
    before :each do
      @client = create(:client)
      @user = create(:user)
      sign_in @user
    end
    context "client signed in" do
      it "assigns a homebuying to @homebuying" do
        some_client = create(:client)
        some_homebuying = create(:homebuying, client_id: some_client.id)
        sign_in some_client
        get :edit, id: some_homebuying
        expect(assigns(:homebuying)).to eq(some_client.homebuying)
      end
    end
    context "user signed in" do
      it "assigns a homebuying to @homebuying" do
        some_user = create(:user)
        some_homebuying = create(:homebuying)
        sign_in some_user
        get :edit, id: some_homebuying.id
        expect(assigns(:homebuying)).to eq(some_homebuying)
      end
    end
    it "renders the #edit template" do
      get :edit, id: create(:homebuying)
      expect(response).to render_template :edit
    end
  end

  # UPDATE
  describe "update #PATCH" do
    before :each do
      @user = create(:user)
      @client = create(:client)
      @homebuying = create(:homebuying, client_id: @client.id)
    end
    context "current_user logged in" do
      it "locates the requested @homebuying" do
        sign_in @user
        put :update, id: @homebuying.id, homebuying: attributes_for(:homebuying)
        expect(assigns(:homebuying)).to eq(@homebuying)
      end
      it "updates the requested @homebuying" do
        sign_in @user
        patch :update, id: @homebuying,
            lender: "new lender",
            realtor_name: "those people"
        @homebuying.reload
        expect(@homebuying.lender).to eq('new lender')
        expect(@homebuying.realtor_name).to eq('those people')
      end
    end
    context "current_client logged in" do
      it "locates the client's @homebuying" do
        sign_in @client
        put :update, id: @homebuying.id, homebuying: attributes_for(:homebuying)
        expect(assigns(:homebuying)).to eq(@client.homebuying)
      end
      it "updates the clients homebuying" do
        sign_in @client
        put :update, id: @client.homebuying,
          lender: "new lender",
          realtor_name: "those people"
        @client.homebuying.reload
        expect(@client.homebuying.lender).to eq('new lender')
        expect(@client.homebuying.realtor_name).to eq('those people')
      end
    end
    context "successfully updates the homebuying" do
      it "updates the flash hash with a success message" do
        sign_in @client
        put :update, id: @client.homebuying,
          homebuying: attributes_for(:homebuying,
            lender: "new lender",
            realtor_name: "those people",
          )
        expect(flash[:success]).to be_present
      end
      it "redirects to that clients homebuying page" do
        sign_in @client
        put :update, id: @client.homebuying,
          homebuying: attributes_for(:homebuying,
            lender: "new lender",
            realtor_name: "those people",
          )
        expect(response).to redirect_to("/homebuyings/#{@homebuying.id}")
      end
    end
    context "fails to update the homebuying" do
      it "rerenders the edit page" do
        sign_in @client
        allow_any_instance_of(Homebuying).to receive(:save).and_return(false)
        put :update, id: @client.homebuying,
          homebuying: attributes_for(:homebuying,
            lender: "new lender",
            realtor_name: "those people",
          )
        expect(response).to render_template :edit
      end
    end
  end

  # DESTROY
  describe "destroy #DELETE" do
    before :each do
      @user = create(:user)
      @client = create(:client)
      @homebuying = create(:homebuying, client_id: @client.id)
      sign_in @client
      sign_in @user
    end
    it "locates the homebuying to be deleted" do
      delete :destroy, id: @homebuying.id
      expect(assigns(:homebuying)).to eq(@homebuying)
    end
    it "deletes the homebuying" do
      expect{
        delete :destroy, id: @homebuying.id
      }.to change(Homebuying, :count).by(-1)
    end
    it "updates the flash has with a danger message" do
      delete :destroy, id: @homebuying.id
      expect(flash[:success]).to be_present
    end
    it "redirects to the clients profile page" do
        delete :destroy, id: @homebuying.id
      expect(response).to redirect_to("/clients/#{@client.id}")
    end
  end
end

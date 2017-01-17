require 'rails_helper'
require 'spec_helper'

RSpec.describe ForeclosuresController, type: :controller do
  include Devise::TestHelpers

  #INDEX
  describe "index #GET" do

    it "finds all Foreclosures" do
      login_user
      foreclosure = create(:foreclosure)
      get :index
      expect(assigns(:foreclosures)).to match_array([
        foreclosure
      ])
    end

    it "renders index template" do
      login_user
      get :index
      expect(response).to render_template :index
    end
  end

  #NEW
  describe "new #GET" do

    it "assigns a Foreclosure instance" do
      login_user
      get :new
      expect(assigns(:foreclosure)).to be_a_new(Foreclosure)
    end

    it "renderes new template" do
      login_user
      get :new
      expect(response).to render_template :new
    end
  end

  #CREATE
  describe "create #POST" do
    describe "properly assigns id based on user status" do
      before :each do
        @some_client = create(:client)
        @some_other_client = create(:client)
        @some_user = create(:user)
      end
      context "current_client logged in" do
        before :each do
          sign_in @some_client
        end
        it "assigns an id equal to the currently logged in clients id" do
          post :create
          expect(assigns(:id)).to eq @some_client.id
        end
      end

      context "current_user logged in" do
        before :each do
          sign_in @some_user
        end
        it "assigns a client id based on the id param" do
          post :create, id: @some_other_client.id
          expect(assigns(:id)).to eq @some_other_client.id
        end
      end
    end

    context "neither user or client logged in" do
      it "doesnt assign id if no user or client is logged in" do
        post :create
        expect(assigns(:id)).to eq nil
      end
    end

    describe "creates a new foreclosure instance and assigns it to foreclosure" do
      it "assigns a foreclosure instance" do
        get :create
        expect(assigns(:foreclosure)).to be_a_new(Foreclosure)
      end
    end

    describe "it attempts to save the foreclosure instance" do
      context "saves successfully" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
        end
        it "updates the flash hash with succuss message" do
          post :create, attributes_for(:foreclosure)
          expect(flash[:success]).to be_present
        end
        it "redirects to the client status page" do
          post :create, attributes_for(:foreclosure)
          expect(response).to redirect_to("/foreclosures/#{@this_client.id}")
        end
      end

      context "fails to save" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
          Foreclosure.any_instance.stub(save: false)
          Foreclosure.any_instance.stub_chain(:errors, :full_messages).and_return(["danger"])
        end
        it "updates the flash message to danger" do
          post :create, attributes_for(:foreclosure)
          expect(flash[:danger]).to be_present
        end
        it "renders the NEW template" do
          post :create, attributes_for(:foreclosure)
          expect(response).to render_template :new
        end
      end
    end
  end

  #SHOW
  describe "show #GET" do
    before :each do
      @this_foreclosure = create(:foreclosure)
    end
    it "assigns a foreclosure instance" do
      get :show, id: @this_foreclosure
      expect(assigns(:foreclosure)).to eq(@this_foreclosure)
    end

    it "renders new template" do
      get :show, id: @this_foreclosure
      expect(response).to render_template :show
    end
  end

  describe "edit #GET" do
    context "client signed in" do
      it "assigns a foreclosure to @foreclosure" do
        some_client = create(:client)
        some_foreclosure = create(:foreclosure, client_id: some_client.id)
        sign_in some_client
        get :edit, id: some_foreclosure
        expect(assigns(:foreclosure)).to eq(some_client.foreclosure)
      end
    end
    context "user signed in" do
      it "assigns a foreclosure to @foreclosure" do
        some_user = create(:user)
        some_foreclosure = create(:foreclosure)
        sign_in some_user
        get :edit, id: some_foreclosure
        expect(assigns(:foreclosure)).to eq(some_foreclosure)
      end
    end
    it "renders the #edit template" do
      get :edit, id: create(:foreclosure)
      expect(response).to render_template :edit
    end
  end

  describe "update #PATCH" do

    before :each do
      @client = create(:client)
      @foreclosure = create(:foreclosure, client_id: @client.id)
    end

    context "current_user logged in" do
      it "locates the requested @foreclosure" do
        sign_in create(:user)
        put :update, id: @foreclosure, foreclosure: attributes_for(:foreclosure)
        expect(assigns(:foreclosure)).to eq(@foreclosure)
      end
      it "updates the requested @foreclosure" do
        sign_in create(:user)
        put :update, id: @foreclosure,
          foreclosure: attributes_for(:foreclosure,
            originating_lender: "bob",
            servicer: "verizon",
          )
        @foreclosure.reload
        expect(@foreclosure.originating_lender).to eq('bob')
        expect(@foreclosure.servicer).to eq('verizon')
      end
    end

    context "current_client logged in" do
      it "locates the client's @foreclosure" do
        sign_in @client
        put :update, id: @foreclosure, foreclosure: attributes_for(:foreclosure)
        expect(assigns(:foreclosure)).to eq(@client.foreclosure)
      end
      it "updates the clients foreclosure" do
        sign_in @client
        put :update, id: @client.foreclosure,
          foreclosure: attributes_for(:foreclosure,
            originating_lender: "bob",
            servicer: "verizon",
          )
        @client.foreclosure.reload
        expect(@client.foreclosure.originating_lender).to eq('bob')
        expect(@client.foreclosure.servicer).to eq('verizon')
      end
    end
    context "successfully updates the foreclosure" do
      it "updates the flash hash with a success message" do
        sign_in @client
        put :update, id: @client.foreclosure,
          foreclosure: attributes_for(:foreclosure,
            originating_lender: "aquaman",
            servicer: "comcast",
          )
        expect(flash[:success]).to be_present
      end

      it "redirects to that clients status page" do
        sign_in @client
        put :update, id: @client.foreclosure,
          foreclosure: attributes_for(:foreclosure,
            originating_lender: "aquaman",
            servicer: "comcast",
          )
        expect(response).to redirect_to("/clients/#{@foreclosure.client_id}")
      end
    end

    context "fails to update the foreclosure" do
      it "rerenders the edit page" do
        sign_in @client
        Foreclosure.any_instance.stub(save: false)
        put :update, id: @client.foreclosure,
          foreclosure: attributes_for(:foreclosure,
            originating_lender: "bob",
            servicer: "verizon",
          )
        expect(response).to render_template :edit
      end
    end
  end

  # DESTROY
  describe "destroy #DELETE" do
    before :each do
      @foreclosure = create(:foreclosure)
    end
    it "locates the foreclosure to be deleted" do
      delete :destroy, id: @foreclosure.id
      expect(assigns(:foreclosure)).to eq(@foreclosure)
    end
    it "deletes the foreclosure" do
      expect {
        delete :destroy, id: @foreclosure.id
      }.to change(Foreclosure, :count).by(-1)
    end
    it "updates the flash has with a danger message" do
      delete :destroy, id: @foreclosure.id
      expect(flash[:danger]).to be_present
    end
    it "redirects to the clients status page" do
      delete :destroy, id: @foreclosure.id
      expect(response).to redirect_to("/clients/#{@foreclosure.id}/status")
    end
  end
end

require 'rails_helper'

RSpec.describe RentalsController, type: :controller do
  include Devise::TestHelpers

  describe 'GET #new' do
    context "current_client signed in" do
      before(:each) do
        @client = FactoryGirl.create(:client)
        sign_in @client
      end
      it "assigns a new Rental to @rental" do
        get :new
        expect(assigns(:rental)).to be_a_new(Rental) 
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
    context "current_user signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
      it "redirects user to root" do
        get :new
        expect(response).to redirect_to "/"
      end
    end
  end

  describe 'POST #create' do
    before(:each) do
      @client = FactoryGirl.create(:client)
      @user = FactoryGirl.create(:user)
    end
    context "current_client signed in" do
      before(:each) do
        sign_in @client
      end
      it "assigns an id equal to the currently logged in CLIENT's id" do
        post :create
        expect(assigns(:id)).to eq @client.id
      end
    end
    context "with valid attributes" do
      before(:each) do
        sign_in @client
      end
      it "saves the new rental in the database" do
        post :create, FactoryGirl.attributes_for(:rental)
        rentals = Rental.all
        expect(rentals.length).to eq(1)
      end
      it "has a success flash message" do
        post :create, attributes_for(:rental)
        expect(flash[:success]).to be_present
      end
      it "redirects to clients#status" do
        post :create, FactoryGirl.attributes_for(:rental)
        expect(response).to redirect_to "/clients/#{@client.id}/status"
      end
    end
    context "with invalid attributes" do
      before(:each) do
        sign_in @client
      end
      it "does not save the new rental in the database" do
        post :create, FactoryGirl.attributes_for(:rental, :invalid)
        rentals = Rental.all
        expect(rentals.length).to eq(0)
      end
      it "has a danger flash message" do
        post :create, attributes_for(:rental, :invalid)
        expect(flash[:danger]).to be_present
      end
      it "renders the rentals/new template" do
        post :create, FactoryGirl.attributes_for(:rental, :invalid)
        expect(response).to render_template :new
      end
    end
  end

  describe "#GET edit" do
    before :each do
      @client = create(:client)
      @rental = create(:rental, client_id: @client.id)
    end
    context "client signed in" do
      it "assigns a Rental to @rental" do
        sign_in @client
        get :edit, id: @rental
        expect(assigns(:rental)).to eq(@client.rental)
      end
    end
    context "user signed in" do
      it "assigns a Rental to @rental" do
        user = create(:user)
        sign_in user
        get :edit, id: @rental
        expect(assigns(:rental)).to eq(@rental)
      end
    end
    it "renders the edit template" do
      get :edit, id: @rental
      expect(response).to render_template :edit
    end
  end

  describe "show #GET" do
    before :each do
      client = create(:client)
      @rental = create(:rental, client_id: client.id)
    end
    it "assigns a Rental to @rental" do
      get :show, id: @rental
      expect(assigns(:rental)).to eq(@rental)
    end

    it "renders new template" do
      get :show, id: @rental
      expect(response).to render_template :show
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @client = create(:client)
      @rental = create(:rental, client_id: @client.id)
    end

    it "deletes the Rental" do
      expect {
        delete :destroy, id: @rental
      }.to change(Rental,:count).by(-1)
    end
    it "has a danger flash message" do
        delete :destroy, id: @rental
        expect(flash[:danger]).to be_present
    end
    it "redirects to clients#status" do
      delete :destroy, id: @rental
      expect(response).to redirect_to "/clients/#{@client.id}/status"
    end
  end

end

require 'rails_helper'

RSpec.describe RentalsController, type: :controller do

  describe 'GET #new' do
    it "assigns a new Rental to @rental" do
      get :new
      expect(assigns(:rental)).to be_a_new(Rental) 
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      # client = FactoryGirl.create(:client)
      # sign_in client
    end

    context "with valid attributes" do
      it "saves the new rental in the database" do
        client = FactoryGirl.create(:client)
        sign_in client

        before_count = Rental.count
        post :create, rental: attributes_for(:rental)
        expect(Rental.count).not_to eq(before_count)
      end
      it "redirects to clients#status"
    end
  end

end

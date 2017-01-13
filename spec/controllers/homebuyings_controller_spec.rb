require 'rails_helper'
require 'spec_helper'
require 'rspec/rails'
require 'devise'

RSpec.describe HomebuyingsController, type: :controller do

  include Devise::TestHelpers

	describe "index #GET" do
		it "assigns an array of Homebuyings" do
			homebuying1 = create(:homebuying)
			homebuying2 = create(:homebuying)
			homebuying3 = create(:homebuying)
			get :index
			expect(
				assigns(
					:homebuyings
				)
			).to match_array([homebuying1, homebuying2, homebuying3])
		end

		it "renders index template" do
      get :index
      expect(response).to render_template :index
		end
	end

    describe "new #GET" do
      it "assigns a homebuying instance" do
        get :new
        expect(assigns(:homebuying)).to be_a_new(Homebuying)
      end

      it "renders new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "create #GET" do
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

      describe "creates a new homebuying instance and assigns it to homebuying" do
        it "assigns a homebuying instance" do
          get :create
          expect(assigns(:homebuying)).to be_a_new(Homebuying)
        end
      end

      describe "it attempts to save the homebuying instance" do
        context "saves successfully" do
          it "creates a new programemployee" do
            sign_in create(:client)
            expect{post :create, attributes_for(:homebuying)}.to change(ProgramEmployee, :count).by(1)
          end
        end

        context "fails to save" do
        end
      end
    end

end

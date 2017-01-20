require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  describe "Get #index" do
    context 'signed in as a user' do
      it "populates an array of unassigned clients" do
        client1 = create(:client)
        client2 = create(:client)
        get :index
        expect(assigns(:clients)).to match_array([client1, client2])
      end
    end

    it "renders an :index template" do
      get :index
      expect(response).to render_template :index
    end  
  end

  describe "Get #show" do
    before :each do
      @this_user = create(:user)
    end

    it "assigns a user instance" do
      get :show, id: @this_user
      expect(assigns(:user)).to eq(@this_user)
    end

    it "finds an array of clients based on user id" do
      client1 = create(:client, user_id: @this_user.id)
      client2 = create(:client, user_id: @this_user.id)
      get :show, id: @this_user
      expect(assigns(:clients)).to match_array([client1, client2])
    end

    it "renders :show template" do
      get :show, id: @this_user
      expect(response).to render_template :show
    end
  end

  describe "Get #new" do
    it "creates a user instance" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders a :new template" do
      get :new
      expect(response).to render_template :new
    end  
  end

  describe "Post #create" do
    describe "creates an instance of a user and assigns it to @user" do
      it "assigns a user instance" do
        user = create(:user)
        post :create, {user: attributes_for(:user)}
        expect(assigns(:user)).to be_a_new(User)
      end
      context "saves succesfully" do
        it "saves a new User to the db" do
          expect{
                  post :create, {user: attributes_for(:user)}
                }.to change(User, :count).by(1)
        end
        it "redirects to the user show page" do
          post :create, {user: attributes_for(:user)}
          expect(response).to redirect_to("/users/#{assigns[:user].id}")
        end
        it "updates the flash hash with success message" do
          post :create, {user: attributes_for(:user)}
          expect(flash[:success]).to be_present
        end
      end
      context "save fails" do
        before :each do
          User.any_instance.stub(save: false)
          User.any_instance.stub_chain(:errors, :full_messages).and_return(["danger"])
        end
        it "render the new template" do
          post :create, {user: attributes_for(:user)}
          expect(response).to render_template :new
        end
        it "updates the flash hash with danger message" do
          post :create, {user: attributes_for(:user)}
          expect(flash[:danger]).to be_present
        end
      end
    end

    # describe " " do

    # end
  end
#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #show" do
#     it "returns http success" do
#       get :show
#       expect(response).to have_http_status(:success)
#     end
#   end






end

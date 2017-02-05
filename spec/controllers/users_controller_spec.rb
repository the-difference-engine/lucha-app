require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  describe "Get #index" do
    context 'signed in as a user' do
      it "populates an array of unassigned clients" do
        client1 = create(:client, user_id: nil)
        client2 = create(:client, user_id: nil)
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
      xit "assigns a user instance" do
        post :create, user: attributes_for(:user)
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
          allow_any_instance_of(User).to receive(:save).and_return(false)
          allow_any_instance_of(User).to receive_message_chain(:errors, :full_messages).and_return(["danger"])
        end
        it "render a :new template" do
          post :create, {user: attributes_for(:user)}
          expect(response).to render_template :new
        end
        it "updates the flash hash with danger message" do
          post :create, {user: attributes_for(:user)}
          expect(flash[:danger]).to be_present
        end
      end
    end
  end

  describe 'Get #edit' do
    it "assigns the requested user to @user" do
      @another_user = create(:user)
      sign_in @another_user
      get :edit, id: @another_user.id
      expect(assigns(:user)).to eq(@another_user)
    end

    it "renders the :edit template" do
      @other_user = create(:user)
      sign_in @other_user
      get :edit, id: @other_user
      expect(response).to render_template :edit
    end
  end

  describe '#devise_mapping' do
  end

  describe 'Post #search' do
  end

  describe 'Get #destroy' do
  end
end
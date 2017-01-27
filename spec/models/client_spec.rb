require 'rails_helper'
require 'spec_helper'

RSpec.describe Client, type: :model do

  describe 'validations' do
    it 'is valid with valid attributes'do
      client = Client.new(attributes_for(:client))
      expect(client).to be_valid
    end
    it 'is invalid without a first_name' do
      client = build(:client, first_name: nil)
      client.valid?
      expect(client.errors[:first_name]).to include("can't be blank")
    end
    it 'is invalid without a last_name' do
      client = build(:client, last_name: nil)
      client.valid?
      expect(client.errors[:last_name]).to include("can't be blank")
    end
    it 'is invalid without an authorization_and_waiver attribute' do
      client = build(:client, authorization_and_waiver: nil)
      client.valid?
      expect(client.errors[:authorization_and_waiver]).to include("can't be blank")
    end
    it 'is invalid without a privacy_policy_authorization attribute' do
      client = build(:client, privacy_policy_authorization: nil)
      client.valid?
      expect(client.errors[:privacy_policy_authorization]).to include("can't be blank")
    end
    it 'is invalid without an email address' do
      client = build(:client, email: nil)
      client.valid?
      expect(client.errors[:email]).to include("can't be blank")
    end
    it 'is invalid without a properly formatted email address' do
      client = build(:client, email: 'Crispin')
      client.valid?
      expect(client.errors[:email]).to include("is invalid")
    end
    it 'is invalid without a unique email address' do
      client = create(:client)
      another_client = build(:client, email: client.email)
      another_client.valid?
      expect(another_client.errors[:email]).to include("has already been taken")
    end
  end

  describe '#full_name' do
    it 'should return the first and last name titleized' do
      client = create(:client, first_name: "Bob", last_name: "Whatever")
      client.full_name
      expect(client.full_name).to eq("Bob Whatever")
    end
  end

  describe '#has_user?' do
    it 'should return true if the client has been assigned a user' do
      user = create(:user)
      client = create(:client, user_id: user.id)
      expect(client.has_user?).to be(true)
    end
    it 'should return false if the client has NOT been assigned a user' do
      client = create(:client, user_id: nil)
      expect(client.has_user?).to be(false)
    end
  end

  describe '#client_applications' do
    it 'should return an array of all the applications the client has started and/or submitted' do
      client = create(:client)
      foreclosure = create(:foreclosure, client_id: client.id)
      homebuying = create(:homebuying, client_id: client.id)
      rental = create(:rental, client_id: client.id)
      expect(client.client_applications.length).to eq(3)
      expect(client.client_applications).to match_array([foreclosure, homebuying, rental])
    end
  end


end

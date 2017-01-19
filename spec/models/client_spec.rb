# == Schema Information
#
# Table name: clients
#
#  id                           :integer          not null, primary key
#  email                        :string           default(""), not null
#  encrypted_password           :string           default(""), not null
#  reset_password_token         :string
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string
#  last_sign_in_ip              :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  first_name                   :string
#  last_name                    :string
#  race                         :string
#  sex                          :string
#  home_phone                   :string
#  work_phone                   :string
#  cell_phone                   :string
#  address                      :string
#  city                         :string
#  state                        :string
#  ward                         :integer
#  zip_code                     :string
#  ssn                          :string
#  preferred_contact_method     :string
#  preferred_language           :string
#  marital_status               :string
#  dob                          :date
#  head_of_household            :boolean          default(FALSE), not null
#  num_in_household             :integer
#  num_of_dependants            :integer
#  education_level              :string
#  disability                   :boolean          default(FALSE), not null
#  union_member                 :boolean          default(FALSE), not null
#  military_service_member      :boolean          default(FALSE), not null
#  volunteer_interest           :boolean          default(FALSE), not null
#  estimated_household_income   :string
#  authorization_and_waiver     :boolean
#  privacy_policy_authorization :boolean
#  user_id                      :integer
#  assign                       :boolean
#

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
	xit 'is invalid without a unique email address' do
		client = create(:client)
		another_client = Client.new(attributes_for(:client))
		another_client.valid?
		expect(another_client.errors[:email]).to include("is already taken")
	end
end

describe '#full_name' do
	it 'should return the first and last name titleized' do
		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
		client.full_name
		expect(client.full_name).to eq("Bob Whatever")	
	end
end

describe '#column_count' do
	it 'should return the number of columns in the model that can be interacted with by the client' do
		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
		client.column_count
		expect(client.column_count).to eq(Client.columns.size - 4)	
	end
end

xdescribe '#filled_columns' do
	it 'should return the number of columns which are interactable to the client that are not nil' do
		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
		client.filled_columns
		expect(client.filled_columns).to eq(4)
	end
end

xdescribe '#client_applications' do
	it 'should return an array of all the applications the client has started and/or submitted' do
		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
		foreclosure = Foreclosure.create(originating_lender: "Whomever it may be", client_id: client.id)
		homebuying = Homebuying.create(lender: "BOA", client_id: client.id)
		client.client_applications
		expect(client.client_applications.length).to eq(2)
	end
end

xdescribe '#counselors' do
	it 'should return an array of users that are currently assigned to the clients applications' do
		client = Client.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
		foreclosure = Foreclosure.create(originating_lender: "Whomever it may be", client_id: client.id)
		homebuying = Homebuying.create(lender: "BOA", client_id: client.id)
		rental = Rental.create(evictions: 4, client_id: client.id)
		employee = User.create(email:"schmuckers@decoy.org", password: "password", first_name: "Prawn", last_name: "Schmucker")
		second_employee = User.create(email:"Boberino@decoy.org", password: "password", first_name: "Bob", last_name: "Robertino")

		ProgramEmployee.create(user_id: employee.id, programable_id: foreclosure.id, programable_type: "Foreclosure")
		ProgramEmployee.create(user_id: second_employee.id, programable_id: rental.id, programable_type: "Rental")
		expect(client.counselors.length).to eq(2)
	end
end

end

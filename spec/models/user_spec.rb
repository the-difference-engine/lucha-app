# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  position               :string
#  home_phone             :string
#  work_phone             :string
#  cell_phone             :string
#  permissions            :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do

	describe '#full_name' do
		it 'should return the number of columns in the model' do
			user = User.create(email: "Shoobop@aol.com" , password: "password", first_name: "Bob", last_name: "Whatever")
			user.full_name
		expect(user.full_name).to eq("Bob Whatever")	
		end
	end

	describe '#cases' do
		it 'should return an array of clients currently assigned to the User' do
		end
	end



end

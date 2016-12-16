# == Schema Information
#
# Table name: homebuyings
#
#  id                         :integer          not null, primary key
#  lender                     :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  client_id                  :integer
#  hear_of_workshop           :string
#  contact_for_appointment    :boolean          default(FALSE)
#  real_estate_contract       :boolean          default(FALSE)
#  realtor_name               :string
#  realtor_phone              :string
#  property_address           :string
#  property_state             :string
#  property_city              :string
#  loan_officer_name          :string
#  loan_officer_email         :string
#  loan_officer_phone         :string
#  payment_assistance_program :string
#  approx_closing_date        :string
#

# require 'rails_helper'

# RSpec.describe Homebuying, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

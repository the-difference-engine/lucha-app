# == Schema Information
#
# Table name: rentals
#
#  id                      :integer          not null, primary key
#  evictions               :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  client_id               :integer
#  waitlist_num            :integer
#  studio                  :boolean          default(FALSE)
#  two_bed                 :boolean          default(FALSE)
#  three_bed               :boolean          default(FALSE)
#  wheelchair_accessible   :boolean
#  car_owner               :boolean          default(FALSE)
#  pet_owner               :boolean          default(FALSE)
#  kind_of_pet             :string
#  hear_of_property        :string
#  reasons_for_application :text
#  landlord_name           :string
#  landlord_address        :string
#  landlord_phone          :string
#  occupancy_at_apartment  :string
#  monthly_rent            :decimal(6, 2)
#  fuel_electric           :decimal(6, 2)
#  pre_landlord_name       :string
#  pre_landlord_address    :string
#  pre_landlord_phone      :string
#  pre_rent                :decimal(6, 2)
#  pre_fuel_electric       :decimal(6, 2)
#  reason_for_move         :text
#  housing_situation       :string
#  employer_name           :string
#  employer_address        :string
#  employer_city           :string
#  employer_state          :string
#  employer_phone          :string
#  position                :string
#  length_employed         :integer
#  personal_reference_name :string
#  per_ref_address         :string
#  per_ref_street          :string
#  per_ref_state           :string
#  per_ref_phone           :string
#  per_ref_relationship    :string
#  displaced               :text
#  homeless                :text
#  over_fifty_percent      :boolean          default(FALSE)
#  agree_to_fee            :boolean          default(FALSE)
#

# require 'rails_helper'

# RSpec.describe Rental, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

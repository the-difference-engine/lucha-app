class AddColumnsToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :waitlist_num, :integer
    add_column :rentals, :studio, :boolean, default: false
    add_column :rentals, :two_bed, :boolean, default: false
    add_column :rentals, :three_bed, :boolean, default: false
    add_column :rentals, :wheelchair_accessible, :boolean
    add_column :rentals, :car_owner, :boolean, default: false
    add_column :rentals, :pet_owner, :boolean, default: false
    add_column :rentals, :kind_of_pet, :string
    add_column :rentals, :hear_of_property, :string
    add_column :rentals, :reasons_for_application, :text
    add_column :rentals, :landlord_name, :string
    add_column :rentals, :landlord_address, :string
    add_column :rentals, :landlord_phone, :string
    add_column :rentals, :occupancy_at_apartment, :string
    add_column :rentals, :monthly_rent, :decimal, precision: 6, scale: 2
    add_column :rentals, :fuel_electric, :decimal, precision: 6, scale: 2
    add_column :rentals, :pre_landlord_name, :string
    add_column :rentals, :pre_landlord_address, :string
    add_column :rentals, :pre_landlord_phone, :string
    add_column :rentals, :pre_rent, :decimal, precision: 6, scale: 2
    add_column :rentals, :pre_fuel_electric, :decimal, precision: 6, scale: 2
    add_column :rentals, :reason_for_move, :text
    add_column :rentals, :housing_situation, :string
    add_column :rentals, :employer_name, :string
    add_column :rentals, :employer_address, :string
    add_column :rentals, :employer_city, :string
    add_column :rentals, :employer_state, :string
    add_column :rentals, :employer_phone, :string
    add_column :rentals, :position, :string
    add_column :rentals, :length_employed, :integer
    add_column :rentals, :personal_reference_name, :string
    add_column :rentals, :per_ref_address, :string
    add_column :rentals, :per_ref_street, :string
    add_column :rentals, :per_ref_state, :string
    add_column :rentals, :per_ref_phone, :string
    add_column :rentals, :per_ref_relationship, :string
    add_column :rentals, :displaced, :text
    add_column :rentals, :homeless, :text
    add_column :rentals, :over_fifty_percent, :boolean, default: false
    add_column :rentals, :agree_to_fee, :boolean, default: false
  end
end

class AddColumnsToHomebuyings < ActiveRecord::Migration
  def change
    add_column :homebuyings, :hear_of_workshop, :string
    add_column :homebuyings, :contact_for_appointment, :boolean
    add_column :homebuyings, :real_estate_contract, :boolean
    add_column :homebuyings, :realtor_name, :string
    add_column :homebuyings, :realtor_phone, :string
    add_column :homebuyings, :property_address, :string
    add_column :homebuyings, :property_state, :string
    add_column :homebuyings, :property_city, :string
    add_column :homebuyings, :loan_officer_name, :string
    add_column :homebuyings, :loan_officer_email, :string
    add_column :homebuyings, :loan_officer_phone, :string
    add_column :homebuyings, :payment_assistance_program, :string
    add_column :homebuyings, :approx_closing_date, :string
  end
end

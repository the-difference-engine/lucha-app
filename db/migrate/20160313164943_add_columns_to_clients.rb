class AddColumnsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :ssn, :string
    add_column :clients, :preferred_contact_method, :string
    add_column :clients, :preferred_language, :string
    add_column :clients, :marital_status, :string
    add_column :clients, :dob, :date
    add_column :clients, :head_of_household, :boolean, null: false, default: false
    add_column :clients, :num_in_household, :integer
    add_column :clients, :num_of_dependants, :integer
    add_column :clients, :education_level, :string
    add_column :clients, :disability, :boolean, null: false, default: false
    add_column :clients, :union_member, :boolean, null: false, default: false
    add_column :clients, :military_service_member, :boolean, null: false, default: false
    add_column :clients, :volunteer_interest, :boolean, null: false, default: false
    add_column :clients, :estimated_household_income, :decimal, :precision => 9, :scale => 2 
  end
end

class AddDisabilityInHouseholdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :disability_in_household, :boolean, default: false
  end
end

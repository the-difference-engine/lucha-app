class ChangeEstimatedHouseholdIncomeInClients < ActiveRecord::Migration
  def change
  	change_column(:clients, :estimated_household_income, :string)

  end
end

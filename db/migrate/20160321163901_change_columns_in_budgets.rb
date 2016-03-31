class ChangeColumnsInBudgets < ActiveRecord::Migration
  def change

  	change_column :budgets, :gross_wages, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :self_employment_income, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :overtime, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :unemployment, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :tips_commisions_bonus, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :nontaxable_social_security, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :taxable_social_security, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :rental_income, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :other_income, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :primary_checking, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :secondary_checking, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :savings_money_market, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :stocks_or_bonds, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :four_zero_one_k, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :home_equity, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :other_property, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :car, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :other_assets, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :principal_and_interest, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :prop_tax, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :assoc_fees, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :junior_mortgage, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :min_credit_card_payment, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :student_loan, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :gas, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :electricity, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :water, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :phone, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :other_utilities, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :food, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :gas_car_maintenance, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :child_care, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :medical_expenses, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :rent, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :rental_insurance, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :total_monthly_debt, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :debt_divided_by_income, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :gross_monthly_income, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :clothing, :decimal, precision: 8, scale: 2, :default => 0.0
  	change_column :budgets, :auto_insurance, :decimal, precision: 8, scale: 2, :default => 0.0
  end
end

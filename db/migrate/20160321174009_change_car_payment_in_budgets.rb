class ChangeCarPaymentInBudgets < ActiveRecord::Migration
  def change
  	change_column :budgets, :car_payment, :decimal, precision: 8, scale: 2, :default => 0.0
  end
end

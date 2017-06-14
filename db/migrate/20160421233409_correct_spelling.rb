class CorrectSpelling < ActiveRecord::Migration
  def change
    rename_column :budgets, :tips_commisions_bonus, :tips_commissions_bonus
  end
end

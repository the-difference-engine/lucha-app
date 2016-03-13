class AddClientIdToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :client_id, :integer
  end
end

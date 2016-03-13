class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
    	t.decimal :gross_wages, precision: 8, scale: 2
    	

      t.timestamps null: false
    end
  end
end

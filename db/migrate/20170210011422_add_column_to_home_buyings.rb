class AddColumnToHomeBuyings < ActiveRecord::Migration
  def change
    add_column :homebuyings, :loan_type, :string
  end
end

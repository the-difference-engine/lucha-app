class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :string
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :cell_phone, :string
    add_column :users, :permissions, :integer
  end
end

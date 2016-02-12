class AddInfoToClients < ActiveRecord::Migration
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :race, :string
    add_column :clients, :sex, :string
    add_column :clients, :home_phone, :string
    add_column :clients, :work_phone, :string
    add_column :clients, :cell_phone, :string
    add_column :clients, :address, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :ward, :integer
    add_column :clients, :zip_code, :string
  end
end

class AddBedroomsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :bedrooms, :string
  end
end

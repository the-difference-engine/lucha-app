class RemoveBedroomsFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :bedrooms, :string
  end
end

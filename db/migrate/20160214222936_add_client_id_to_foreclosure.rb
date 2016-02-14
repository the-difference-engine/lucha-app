class AddClientIdToForeclosure < ActiveRecord::Migration
  def change
    add_column :foreclosures, :client_id, :integer
    add_column :homebuyings, :client_id, :integer
    add_column :rentals, :client_id, :integer
    add_column :law_projects, :client_id, :integer
    add_column :senior_repairs, :client_id, :integer
  end
end

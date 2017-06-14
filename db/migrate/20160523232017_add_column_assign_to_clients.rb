class AddColumnAssignToClients < ActiveRecord::Migration
  def change
    add_column :clients, :assign, :boolean
  end
end

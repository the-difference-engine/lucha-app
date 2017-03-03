class RemoveAdminFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :Admin, :boolean, default: false
  end
end

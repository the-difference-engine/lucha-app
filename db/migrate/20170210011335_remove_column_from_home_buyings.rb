class RemoveColumnFromHomeBuyings < ActiveRecord::Migration
  def change
    remove_column :homebuyings, :hear_of_workshop, :string
  end
end

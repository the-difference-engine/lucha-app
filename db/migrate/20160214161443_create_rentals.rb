class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :evictions

      t.timestamps null: false
    end
  end
end

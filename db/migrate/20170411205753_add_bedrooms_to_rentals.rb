class AddBedroomsToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :bedrooms, :string
  end
end

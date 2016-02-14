class CreateForeclosures < ActiveRecord::Migration
  def change
    create_table :foreclosures do |t|
    	t.string :currently_foreclosed
      t.timestamps null: false
    end
  end
end

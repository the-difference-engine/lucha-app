class CreateHomebuyings < ActiveRecord::Migration
  def change
    create_table :homebuyings do |t|
      t.string :lender

      t.timestamps null: false
    end
  end
end

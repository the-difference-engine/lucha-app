class CreateClientPrograms < ActiveRecord::Migration
  def change
    create_table :client_programs do |t|
      t.integer :client_id
      t.integer :programable_id
      t.string :programable_type

      t.timestamps null: false
    end
  end
end

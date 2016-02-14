class CreateProgramEmployees < ActiveRecord::Migration
  def change
    create_table :program_employees do |t|
      t.integer :user_id
      t.integer :programable_id
      t.string :programable_type

      t.timestamps null: false
    end
  end
end

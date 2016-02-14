class CreateSeniorRepairs < ActiveRecord::Migration
  def change
    create_table :senior_repairs do |t|
      t.string :contractor

      t.timestamps null: false
    end
  end
end

class CreateLawProjects < ActiveRecord::Migration
  def change
    create_table :law_projects do |t|
      t.string :violation_type

      t.timestamps null: false
    end
  end
end

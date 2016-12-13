class DropProgramEmployees < ActiveRecord::Migration
  def change
    drop_table :program_employees
  end
end

class DropClientPrograms < ActiveRecord::Migration
  def change
	    drop_table :client_programs
  end
end

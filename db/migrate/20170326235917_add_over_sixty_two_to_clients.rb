class AddOverSixtyTwoToClients < ActiveRecord::Migration
  def change
    add_column :clients, :over_sixty_two, :boolean, default: false
  end
end

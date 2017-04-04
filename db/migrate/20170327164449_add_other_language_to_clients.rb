class AddOtherLanguageToClients < ActiveRecord::Migration
  def change
    add_column :clients, :other_language, :string
  end
end

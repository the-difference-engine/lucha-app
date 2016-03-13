class AddAuthorizationToClients < ActiveRecord::Migration
  def change
    add_column :clients, :authorization_and_waiver, :boolean
    add_column :clients, :privacy_policy_authorization, :boolean
  end
end

class ChangeContactForAppointmentInHomebuyings < ActiveRecord::Migration
  def change
  	change_column :homebuyings, :contact_for_appointment, :boolean, default: false
    change_column :homebuyings, :real_estate_contract, :boolean, default: false
  end
end

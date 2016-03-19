class AddReasonForDefaultToForeclosures < ActiveRecord::Migration
  def change
    add_column :foreclosures, :reason_for_default, :string
  end
end

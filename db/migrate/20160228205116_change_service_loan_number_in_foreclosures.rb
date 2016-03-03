class ChangeServiceLoanNumberInForeclosures < ActiveRecord::Migration
  def change
  	change_column :foreclosures, :original_loan_number, :string
  	change_column :foreclosures, :servicer_loan_number, :string
  end
end

class AddQuestionsToForeclosures < ActiveRecord::Migration
  def change
    add_column :foreclosures, :originating_lender, :string
    add_column :foreclosures, :original_loan_number, :integer
    add_column :foreclosures, :servicer, :string
    add_column :foreclosures, :servicer_loan_number, :integer
    add_column :foreclosures, :monthly_mortgage_payment, :decimal, :precision => 8, :scale => 2
    add_column :foreclosures, :loan_term, :integer
    add_column :foreclosures, :origination_date, :date
    add_column :foreclosures, :been_to_court, :boolean
    add_column :foreclosures, :court_case_number, :string
    add_column :foreclosures, :working_with_lawyer, :boolean
    add_column :foreclosures, :working_w_agency, :boolean
    add_column :foreclosures, :agency, :string
  end
end

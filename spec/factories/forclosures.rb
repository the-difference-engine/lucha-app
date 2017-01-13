FactoryGirl.define do
  factory :foreclosure do
    currently_foreclosed "stuff"
    client
    originating_lender "bob"
    original_loan_number "3276"
    servicer "verizon"
    servicer_loan_number "3765"
    monthly_mortgage_payment 345.51
    loan_term 3
    origination_date "11/09/2007"
    been_to_court true
    court_case_number "921"
    working_with_lawyer true
    working_w_agency true
    agency "the best agency"
    reason_for_default "never lucky"
  end
end

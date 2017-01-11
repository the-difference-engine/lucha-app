FactoryGirl.define do
  factory :forclosure do
    currently_foreclosed "stuff"
    cliend_id 3
    originating_lender "bob"
    original_loan_number "3276"
    servicer "verizon"
    ervicer_loan_number "3765"
    monthly_mortgage_payment 345.51
    loan_term 3
    origination_date 20140931
    been_to_court true
    court_case_number "921"
    working_with_lawyer true
    working_w_agency true
    agency "the best agency"
    reason_for_default "scumbag"
  end
end

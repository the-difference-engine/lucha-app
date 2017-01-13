FactoryGirl.define do

  factory :homebuying do
    lender "bunk_mortgage"
    client_id 1
    hear_of_workshop "internet"
    contact_for_appointment [true, false].sample
    real_estate_contract [true, false].sample
    realtor_name "realtor"
    realtor_phone "123-456-7890"
    property_address "123 Anywhere Lane"
    property_state "Illinois"
    property_city "Chicago"
    loan_officer_name "John"
    loan_officer_email "John@email.com"
    loan_officer_phone "123-456-7890"
    payment_assistance_program "liheap"
    approx_closing_date Date.current

  end

end
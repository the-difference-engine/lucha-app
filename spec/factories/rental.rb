FactoryGirl.define do
  factory :rental do
    client
    evictions 1
    waitlist_num 1
    studio true
    two_bed true
    three_bed true
    wheelchair_accessible true
    car_owner true
    pet_owner true
    kind_of_pet "cat"
    hear_of_property "Mom"
    reasons_for_application "1"
    landlord_name "John"
    landlord_address "123 Main St."
    landlord_phone "3122234321"
    occupancy_at_apartment "2"
    monthly_rent 123.45
    fuel_electric 123.45
    pre_landlord_name "John"
    pre_landlord_address "123 Main St."
    pre_landlord_phone "3122234321"
    pre_rent 123.45
    pre_fuel_electric 123.45
    reason_for_move "cat"
    housing_situation "1"
    employer_name "1"
    employer_address "1"
    employer_city "1"
    employer_state "1"
    employer_phone "7735555555"
    position "1"
    length_employed 10
    personal_reference_name "1"
    per_ref_address "1"
    per_ref_street "1"
    per_ref_state "1"
    per_ref_phone "1"
    per_ref_relationship "1"
    displaced "1"
    homeless "1"
    over_fifty_percent true
    agree_to_fee true

    trait :invalid do
      hear_of_property ""
    end
  end
end

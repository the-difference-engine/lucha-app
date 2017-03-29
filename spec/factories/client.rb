FactoryGirl.define do
  factory :confirmed_client, :parent => :client do
      after(:create) { |client| client.confirm! }
  end

  factory :client do
    first_name "Test"
    last_name "Name"
    user
    sequence(:email){ |n| "peterpan#{n}@example.com"}
    password "12345678"
    password_confirmation "12345678"
    authorization_and_waiver true
    privacy_policy_authorization true
    ssn "123121234"
    home_phone "4351234567"
    cell_phone "3125551212"
    work_phone "3125551214"
    preferred_contact_method "3125551214"
    preferred_language "English"
    marital_status "Single"
    dob 19940301
    num_in_household 3
    num_of_dependants 1
    sex "Male"
    race "Hispanic/Latino"
    education_level "GED"
    estimated_household_income "$15,000 or Less"
    disability true
    union_member true
    military_service_member true
    volunteer_interest true
    head_of_household true

    trait :invalid do
      email nil
    end
  end
end

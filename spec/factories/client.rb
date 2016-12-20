FactoryGirl.define do
  factory :confirmed_client, :parent => :client do
      after(:create) { |client| client.confirm! }
  end
  factory :client do
    first_name "Peter"
    last_name "Pan"
    email "peterpan@example.com"
    password "12345678"
    password_confirmation "12345678"
    authorization_and_waiver true
    privacy_policy_authorization true
    # client_id { [FactoryGirl.create(:client)]}
  end

  factory :invalid_client, :parent => :client do
    email nil
  end
  
end
FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    email "janedoe@example.com"
    password "12345678"
    password_confirmation "12345678"
  end
  
end
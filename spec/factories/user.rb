FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    email "janedoe@example.com"
    password "12345678"
    password_confirmation "12345678"
    home_phone "293-345-3457"
    work_phone "432-234-6756"
    cell_phone "876-456-3454"
  end
  
end
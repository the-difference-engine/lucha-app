FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Doe"
    sequence(:email){ |n| "janedoe#{n}@example.com" }
    password "12345678"
    password_confirmation "12345678"
    home_phone "2933453457"
    work_phone "4322346756"
    cell_phone "8764563454"
    address "1152 N Christiana Ave, Chicago, IL 60651"
  end
end
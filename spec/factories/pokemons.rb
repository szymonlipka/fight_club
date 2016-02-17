FactoryGirl.define do
  factory :pokemon do
    first_name "MyString"
    last_name "MyString"
  end
  factory :pokemon1, class: Pokemon do
    first_name "MyString1"
    last_name "MyString1"
  end
end

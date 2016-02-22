FactoryGirl.define do
  factory :pokemon do
    first_name "MyString"
    last_name "MyString"
    learning 5
    inference 4
    agility 1
  end
  factory :pokemon1, class: Pokemon do
    first_name "MyString1"
    last_name "MyString1"
    flying 4
    speed 4
    strength 2
  end
end

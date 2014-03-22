# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text "MyString"
    user_id 1
    ad_id 1
  end
end

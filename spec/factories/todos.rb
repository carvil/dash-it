# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    description "MyString"
    status "MyString"
    project_id 1
  end
end

FactoryGirl.define do
  factory :project do
    title "MyString"
    short_description "MyText"
    description "MyText"
    image "MyString"
    status 0
    user
  end
end

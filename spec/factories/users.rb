FactoryGirl.define do
  factory :user do
    first_name 'user'
    last_name 'star'
    email 'user@mail.com'
    password '123456789'
    role 0
  end
end

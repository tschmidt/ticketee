FactoryGirl.define do
  factory :user do
    name 'example'
    email 'user@fake.com'
    password 'password'
    password_confirmation 'password'
  end
end
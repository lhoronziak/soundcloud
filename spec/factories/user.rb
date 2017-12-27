FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    encrypted_password { Faker::Internet.password(8) }
  end
end

FactoryGirl.define do
  factory :directory do
    user
    name { Faker::Pokemon.name }
  end
end

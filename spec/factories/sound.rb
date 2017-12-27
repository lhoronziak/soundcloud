FactoryGirl.define do
  factory :sound do
    name { Faker::Music.instrument }
    url { Faker::Internet.url('example.com') }
  end
end

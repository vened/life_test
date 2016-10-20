FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words }
    description { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
  end
end
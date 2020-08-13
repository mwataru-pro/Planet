FactoryBot.define do
  factory :article do
    article_title { Faker::Lorem.characters(number:5) }
    article_content { Faker::Lorem.characters(number:20) }
    admin
  end
end
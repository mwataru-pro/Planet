FactoryBot.define do
  factory :post_image do
    title { Faker::Lorem.characters(number:5) }
    content { Faker::Lorem.characters(number:20) }
    user
  end
end

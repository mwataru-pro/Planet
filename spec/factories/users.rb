FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :other_user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Lorem.characters(number:10) }
    email { 'hoge@example.com' }
    password { 'password' }
    password_confirmation { 'password' }

    factory :other_user do
      name { Faker::Lorem.characters(number:10) }
      email { Faker::Internet.email }
    end
  end
end

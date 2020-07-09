# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 会員情報
100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    )
end

# post_images 投稿
PostImage.create!(
 [
  {
    user_id: 1,
    title: "Test 1" ,
    content: "Test投稿",
    image: open("./db/images/sample1.jpg")
  },
  {
    user_id: 2,
    title: "Test 2" ,
    content: "Test投稿",
    image: open("./db/images/sample2.jpg")
  },
  {
    user_id: 3,
    title: "Test 3" ,
    content: "Test投稿",
    image: open("./db/images/sample3.jpg")
  },
  {
    user_id: 4,
    title: "Test 4" ,
    content: "Test投稿",
    image: open("./db/images/sample4.jpg")
  },
  {
    user_id: 1,
    title: "Test 5" ,
    content: "Test投稿",
    image: open("./db/images/sample5.jpg")
  },
  {
    user_id: 2,
    title: "Test 6" ,
    content: "Test投稿",
    image: open("./db/images/sample6.jpg")
  },
  {
    user_id: 3,
    title: "Test 7" ,
    content: "Test投稿",
    image: open("./db/images/sample7-1.jpg")
  },
  {
    user_id: 4,
    title: "Test 8" ,
    content: "Test投稿",
    image: open("./db/images/sample8.jpg")
  },
  {
    user_id: 1,
    title: "Test 9" ,
    content: "Test投稿",
    image: open("./db/images/sample9.jpg")
  },
  {
    user_id: 2,
    title: "Test 10" ,
    content: "Test投稿",
    image: open("./db/images/sample10.jpg")
  },
  {
    user_id: 3,
    title: "Test 11" ,
    content: "Test投稿",
    image: open("./db/images/sample11.jpg")
  },
  {
    user_id: 4,
    title: "Test 12" ,
    content: "Test投稿",
    image: open("./db/images/sample12.jpg")
  },
  {
    user_id: 1,
    title: "Test 13" ,
    content: "Test投稿",
    image: open("./db/images/sample13.jpg")
  },
  {
    user_id: 2,
    title: "Test 14" ,
    content: "Test投稿",
    image: open("./db/images/sample14.jpg")
  },
  {
    user_id: 3,
    title: "Test 15" ,
    content: "Test投稿",
    image: open("./db/images/sample15.jpg")
  },
  {
    user_id: 4,
    title: "Test 16" ,
    content: "Test投稿",
    image: open("./db/images/sample16.jpg")
  }
 ]
)

# 管理者アカウント
Admin.create!(
  email: "admin@admin.com",
  password: "admins",
  password_confirmation: "admins")

# 記事データ
Article.create!(
 [
  {
    admin_id: 1,
    article_title: "Test記事",
    article_content: "<h3>Test記事です</h3>",
    article_image: open("./db/images/demo1.jpg")
  },
  {
    admin_id: 1,
    article_title: "Test記事2",
    article_content: "<h3>Test記事です</h3>",
    article_image: open("./db/images/demo2.jpg")
  },
 ]
)
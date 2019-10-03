# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
Vote.delete_all
Topic.delete_all
Tag.delete_all
User.delete_all
AdminUser.delete_all

users = [
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name},
  {email: FFaker::Internet.email, password: 'asdfasdf', name: FFaker::Name.name}
]

users.each do |user_data|
  next unless User.find_by(email: user_data[:email]).nil?
  User.create! user_data
end

10.times do
  title = FFaker::HipsterIpsum.word.titleize
  Tag.find_or_create_by title: title, slug: title.parameterize, tag_type: [:category, :tag].sample
end

30.times do
  title = FFaker::Book.title

  topic = {
    title: title,
    slug: title.parameterize,
    body: FFaker::HipsterIpsum.paragraphs(rand(1..3)).join("\n"),
    user: User.all.sample
  }
  topic = Topic.find_or_create_by topic
  topic.tags << Tag.all.sample

  rand(15).times do
    comment = {
      body: FFaker::HipsterIpsum.paragraph,
      topic: topic,
      user: User.all.sample
    }
    Comment.find_or_create_by(comment)
  end
end

AdminUser.create!(email: 'admin@rpginspire.com', password: 'asdfasdf', password_confirmation: 'asdfasdf') if Rails.env.development?


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create!(descript: "500 Base")
Category.create!(descript: "200 More")
Category.create!(descript: "300 Nature")

for i in 1..5
  for j in 1..3
    Word.create!(name: i.to_s, mean: (i*j).to_s, category_id: j.to_s)
  end
end

User.create!(name:  "hieu",
email: "hieu@gmail.com",
password:              "111111",
password_confirmation: "111111",
avatar: "avatar_default.png",
admin: true,
words: 10)

User.create!(name:  "Example User",
email: "example@railstutorial.org",
password:              "foobar",
password_confirmation: "foobar",
avatar: "avatar_default.png",
admin: true,
words: 10)

99.times do |n|
  User.create!(name:  "Example User-#{n+1}",
	email: "example-#{n+1}@railstutorial.org",
	password:              "foobar",
	password_confirmation: "foobar",
	avatar: "avatar_default.png",
	admin: false,
	words: 10)
end

# Following relationships
users = User.all
user  = User.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

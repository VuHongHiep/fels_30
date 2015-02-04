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

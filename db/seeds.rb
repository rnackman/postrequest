# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do |i|
  Topic.create(name: "Topic #{i}", notes: "Notes on Topic #{i}", status: "requested", requester_id: rand(1..5))
end

(1..5).each do |i|
  User.create(name: "User #{i}", role: "Role of User #{i}")
end
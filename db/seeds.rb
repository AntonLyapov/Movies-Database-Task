# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Movie.destroy_all
Comment.destroy_all

Faker::UniqueGenerator.clear

User.create!(name: "Anton Lyapov", email: "test@test.test", password: "123456", role: 'user')

10.times do |i|
  user = Fabricate(:user)
  #puts "Generated #{user.name}"
end

puts "Users generated"

20.times do |i|
  movie = Fabricate(:movie)
  # puts "Generated #{movie.title}"
end

puts "Movies generated"

User.all.each do |user|
	Movie.all.each do |movie|
		Fabricate(:comment, user: user, movie: movie)
	end
end

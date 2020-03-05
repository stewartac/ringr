# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
puts "Cleaning db"
p "."
p ".."
p "..."
Game.destroy_all
Membership.destroy_all
Team.destroy_all
User.destroy_all


puts "Creating users"
user1 = User.create!(first_name: "Alex", last_name: "Stewart", email: "test2@test.com", address: "27a Nevern Square, London", password: "password", date_of_birth: "1991/06/17", gender: "male", profile: "prolific left-booted, goal-scoring machine")
user2 = User.create!(first_name: "Henry", last_name: "Gunn", email: "test3@test.com", address: "10 downing street, London" , password: "password", date_of_birth: "1992/12/25", gender: "male", profile: "occasional casual footballer, more into my netball")
user3 = User.create!(first_name: "Theo", last_name: "Verge", email: "test4@test.com", address: "12 downing street, London" , password: "password", date_of_birth: "1992/10/26", gender: "male", profile: "terrible basketball player, way too small")

puts "Creating teams"

team1 = Team.create!(name: "Farcelona", user: User.first)
team2 = Team.create!(name: "Inter minan", user: User.second)
team3 = Team.create!(name: "Netball FC", user: User.first)
team4 = Team.create!(name: "Theo Lonely basketball FC", user: User.third)

puts "Creating games"

game1 = Game.create!(address: "Stamford Bridge, Fulham Road, London", date: "2020/06/06", time: "17:30", sport: "Football", format: "11-a-side", available_spaces: 2, team: Team.first)
game2 = Game.create!(address: "10 downing street, SW1A 2AA", date: "2020/04/11", time: "18:00", sport: "Football", format: "5-a-side", available_spaces: 1, team: Team.second)
game3 = Game.create!(address: "15 Selwood Terrace, London, SW7 3QG", date: "2020/04/11", time: "18:00", sport: "Netball", format: "7-a-side", available_spaces: 1, team: Team.third)
game4 = Game.create!(address: "69 Colebrooke Row, London, N1 8AA", date: "2020/08/11", time: "19:00", sport: "Basketball", format: "5-a-side", available_spaces: 2, team: team4)

puts "Creating memberships"

membership1 = Membership.create!(team: team1, user: user2)
membership2 = Membership.create!(team: team2, user: user1)

Game.reindex
Game.search_index.delete

puts "Done!"

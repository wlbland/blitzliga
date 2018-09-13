# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   teams = Team.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# see seeds 2
#  teams = Team.create([{ name: 'Coalition'}, { name: 'ING'}, { name: 'Vverkh'}, { name: 'Desperado'}, { name: 'GreenTeam'}, { name: 'Basis'}, { name: 'Klerki'}, { name: 'Red Star'}, { name: 'British Embassy'}, { name: 'Freshmen'}, { name: 'Bro-13'}, { name: 'Anthill'}, { name: 'Moystroitel'}, { name: 'B.O.R.T.'}, { name: 'The Six Offenders'}, { name: 'Black Rocket'}, { name: 'The Unsanctionables'}, { name: 'Cavalry'}, { name: 'CREF'}, { name: 'Great Warriors'}, { name: 'FC Unifin'}, { name: 'The Galactics'}, { name: 'Happy Sundays'}])



User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



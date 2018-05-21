
  teams = Team.create([{ name: 'Coalition'}, { name: 'ING'}, { name: 'Vverkh'}, { name: 'Desperado'}, { name: 'GreenTeam'}, { name: 'Basis'}, { name: 'Klerki'}, { name: 'Red Star'}, { name: 'British Embassy'}, { name: 'Freshmen'}, { name: 'Bro-13'}, { name: 'Anthill'}, { name: 'Moystroitel'}, { name: 'B.O.R.T.'}, { name: 'The Six Offenders'}, { name: 'Black Rocket'}, { name: 'The Unsanctionables'}, { name: 'Cavalry'}, { name: 'CREF'}, { name: 'Great Warriors'}, { name: 'FC Unifin'}, { name: 'The Galactics'}, { name: 'Happy Sundays'}])


  coalition = Team.find_by(name: "Coalition")
  vverkh = Team.find_by(name: "Vverkh")
  desperado = Team.find_by(name: "Desperado")
  red_star = Team.find_by(name: "Red Star")
  freshmen = Team.find_by(name: "Freshmen")
  unsanctionables = Team.find_by(name: "Unsanctionables")
  cavalry = Team.find_by(name: "Cavalry")
  galactics = Team.find_by(name: "The Galactics")

  spartak = Venue.create(name: "Spartak")
  s21 = Season.create(number: 21)
  s22 = Season.create(number: 22)

scheduled_matches =
[{team_1: coalition, team_2: vverkh, time: DateTime.new(2018,5,20,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: desperado, team_2: red_star, time: DateTime.new(2018,5,20,11,0,0,'+03:00'), venue: spartak, season: s22}]



scheduled_matches.each do |match|
  new_fixture = Fixture.create(time: match[:time], venue: match[:venue], season: match[:season])
  TeamFixture.create(team: match[:team_1], fixture: new_fixture)
  TeamFixture.create(team: match[:team_2], fixture: new_fixture)
end

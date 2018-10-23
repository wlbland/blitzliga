
coalition = Team.find_by(name: "Coalition")
# vverkh = Team.find_by(name: "Vverkh")
# desperado = Team.find_by(name: "Desperado")
red_star = Team.find_by(name: "Red Star")
unsanctionables = Team.find_by(name: "The Unsanctionables")
cavalry = Team.find_by(name: "Cavalry")
galactics = Team.find_by(name: "The Galactics")
happy_sundays = Team.find_by(name: "Happy Sundays")
winner_1 = Team.find_by(name: "Winner SF1")
winner_2 = Team.find_by(name: "Winner SF2")
loser_1 = Team.find_by(name: "Loser SF1")
loser_2 = Team.find_by(name: "Loser SF2")
a_team = Team.find_by(name: "1st Placed")
b_team = Team.find_by(name: "2nd Placed")
c_team = Team.find_by(name: "3rd Placed")
d_team = Team.find_by(name: "4th Placed")


evropa = Venue.find_by(name: "Evropa")

s24 = Season.create(number: 24)

 scheduled_matches =
[ {team_1: coalition, team_2: happy_sundays, time: DateTime.new(2018,10,27,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: cavalry, team_2: unsanctionables, time: DateTime.new(2018,10,27,13,0,0,'+03:00'), venue: evropa, season: s24}]

scheduled_matches.each do |match|
  if match[:non_league]
    new_fixture = Fixture.create(time: match[:time], venue: match[:venue], season: match[:season], non_league: true)
    TeamFixture.create(team: match[:team_1], fixture: new_fixture)
    TeamFixture.create(team: match[:team_2], fixture: new_fixture)
    puts "created non-league #{match[:team_1].name} vs #{match[:team_2].name} for season #{match[:season].number}"
  else
    new_fixture = Fixture.create(time: match[:time], venue: match[:venue], season: match[:season])
    TeamFixture.create(team: match[:team_1], fixture: new_fixture)
    TeamFixture.create(team: match[:team_2], fixture: new_fixture)
    puts "created #{match[:team_1].name} vs #{match[:team_2].name} for season #{match[:season].number}"
  end
end

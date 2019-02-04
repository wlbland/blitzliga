

coalition = Team.find_by(name: "Coalition")
moscow_rebels = Team.find_by(name: "Moscow Rebels")
red_star = Team.find_by(name: "Red Star")
unsanctionables = Team.find_by(name: "The Unsanctionables")
cavalry = Team.find_by(name: "Cavalry")
galactics = Team.find_by(name: "The Galactics")
happy_sundays = Team.find_by(name: "Happy Sundays")
winner_1 = Team.find_by(name: "Winner SF1")
winner_2 = Team.find_by(name: "Winner SF2")
a_team = Team.find_by(name: "1st Placed")
b_team = Team.find_by(name: "2nd Placed")
c_team = Team.find_by(name: "3rd Placed")
d_team = Team.find_by(name: "4th Placed")

evropa = Venue.find_by(name: "Evropa")
luzhniki = Venue.find_by(name: "Luzhniki", pitch: "6")
venue_tbc = Venue.create(name: "TBC", pitch: "X")

s25 = Season.find_by(number: 25)


 scheduled_matches =
[ 
{team_1: cavalry, team_2: unsanctionables, time: DateTime.new(2019,02,10,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: red star, team_2:  happy_sundays, time: DateTime.new(2019,02,10,13,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: coalition, team_2: moscow_rebels, time: DateTime.new(2019,02,10,14,0,0,'+03:00'), venue: evropa, season: s25},

{team_1: happy_sundays, team_2: coalition, time: DateTime.new(2019,02,17,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: unsanctionables, team_2: red star, time: DateTime.new(2019,02,17,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: galactics, team_2: cavalry, time: DateTime.new(2019,02,17,12,0,0,'+03:00'), venue: evropa, season: s25},

{team_1: coalition, team_2: cavalry, time: DateTime.new(2019,02,24,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: moscow_rebels, team_2: galactics, time: DateTime.new(2019,02,24,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: happy_sundays, team_2: unsanctionables, time: DateTime.new(2019,02,24,12,0,0,'+03:00'), venue: evropa, season: s25},

{team_1: unsanctionables, team_2: moscow_rebels, time: DateTime.new(2019,03,3,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: galactics, team_2: coalition, time: DateTime.new(2019,03,3,13,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: cavalry, team_2: red_star, time: DateTime.new(2019,03,3,14,0,0,'+03:00'), venue: evropa, season: s25},

{team_1: red_star, team_2: galactics, time: DateTime.new(2019,03,10,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: coalition, team_2: unsanctionables, time: DateTime.new(2019,03,10,13,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: moscow_rebels, team_2: happy_sundays, time: DateTime.new(2019,03,10,14,0,0,'+03:00'), venue: evropa, season: s25},

{team_1: galactics, team_2: happy_sundays, time: DateTime.new(2019,03,17,12,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: cavalry, team_2: moscow_rebels, time: DateTime.new(2019,03,17,13,0,0,'+03:00'), venue: evropa, season: s25},
{team_1: red_star, team_2: coalition, time: DateTime.new(2019,03,17,14,0,0,'+03:00'), venue: evropa, season: s25},

# {team_1: a_team, team_2: d_team, time: DateTime.new(2019,1,20,11,0,0,'+03:00'), venue: venue_tbc, season: s25, non_league: true},
# {team_1: b_team, team_2: c_team, time: DateTime.new(2019,1,20,11,0,0,'+03:00'), venue: venue_tbc, season: s25, non_league: true},
# {team_1: winner_1, team_2: winner_2, time: DateTime.new(2019,1,20,12,0,0,'+03:00'), venue: venue_tbc, season: s25, non_league: true}
]






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

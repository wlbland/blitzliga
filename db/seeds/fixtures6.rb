

coalition = Team.find_by(name: "Coalition")
vverkh = Team.find_by(name: "Vverkh")
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

s23 = Season.find_by(number: 23)
s24 = Season.find_by(number: 24)


 scheduled_matches =
[ {team_1: winner_1, team_2: winner_2, time: DateTime.new(2018,11,11,12,0,0,'+03:00'), venue: venue_tbc, season: s23, non_league: true},

{team_1: cavalry, team_2: vverkh, time: DateTime.new(2018,11,11,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: coalition, team_2: vverkh, time: DateTime.new(2018,11,11,13,0,0,'+03:00'), venue: evropa, season: s24},


{team_1: red_star, team_2: unsanctionables, time: DateTime.new(2018,11,18,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: happy_sundays, team_2: cavalry, time: DateTime.new(2018,11,18,13,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: vverkh, team_2: galactics, time: DateTime.new(2018,11,18,14,0,0,'+03:00'), venue: evropa, season: s24},


{team_1: unsanctionables, team_2: coalition, time: DateTime.new(2018,11,25,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: galactics, team_2: happy_sundays, time: DateTime.new(2018,11,25,13,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: cavalry, team_2: red_star, time: DateTime.new(2018,11,25,14,0,0,'+03:00'), venue: evropa, season: s24},


{team_1: red_star, team_2: galactics, time: DateTime.new(2018,12,2,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: happy_sundays, team_2: vverkh, time: DateTime.new(2018,12,2,13,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: coalition, team_2: cavalry, time: DateTime.new(2018,12,2,14,0,0,'+03:00'), venue: evropa, season: s24},


{team_1: vverkh, team_2: red_star, time: DateTime.new(2018,12,9,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: galactics, team_2: coalition, time: DateTime.new(2018,12,9,13,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: cavalry, team_2: unsanctionables, time: DateTime.new(2018,12,9,14,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: unsanctionables, team_2: galactics, time: DateTime.new(2018,12,9,15,0,0,'+03:00'), venue: venue_tbc, season: s24},


{team_1: coalition, team_2: red_star, time: DateTime.new(2018,12,16,12,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: unsanctionables, team_2: happy_sundays, time: DateTime.new(2018,12,16,13,0,0,'+03:00'), venue: evropa, season: s24},
{team_1: red_star, team_2: happy_sundays, time: DateTime.new(2018,12,16,14,0,0,'+03:00'), venue: evropa, season: s24},

{team_1: a_team, team_2: d_team, time: DateTime.new(2019,1,20,11,0,0,'+03:00'), venue: venue_tbc, season: s24, non_league: true},
{team_1: b_team, team_2: c_team, time: DateTime.new(2019,1,20,11,0,0,'+03:00'), venue: venue_tbc, season: s24, non_league: true},
{team_1: winner_1, team_2: winner_2, time: DateTime.new(2019,1,20,12,0,0,'+03:00'), venue: venue_tbc, season: s24, non_league: true}]






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

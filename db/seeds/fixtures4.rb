

  coalition = Team.find_by(name: "Coalition")
  happy_sundays = Team.find_by(name: "Happy Sundays")
  vverkh = Team.find_by(name: "Vverkh")
  red_star = Team.find_by(name: "Red Star")
  freshmen = Team.find_by(name: "Freshmen")
  unsanctionables = Team.find_by(name: "The Unsanctionables")
  cavalry = Team.find_by(name: "Cavalry")
  galactics = Team.find_by(name: "The Galactics")
  winner_1 = Team.find_by(name: "Winner SF1")
  winner_2 = Team.find_by(name: "Winner SF2")
  loser_1 = Team.find_by(name: "Loser SF1")
  loser_2 = Team.find_by(name: "Loser SF2")
  a_team = Team.find_by(name: "1st Placed")
  b_team = Team.find_by(name: "2nd Placed")
  c_team = Team.find_by(name: "3rd Placed")
  d_team = Team.find_by(name: "4th Placed")

  luzhniki = Venue.create(name: "Luzhniki", pitch: "6")

  s23 = Season.create(number: 23)

scheduled_matches =
[{team_1: galactics, team_2: coalition, time: DateTime.new(2018,9,16,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: unsanctionables, team_2: red_star, time: DateTime.new(2018,9,16,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: happy_sundays, team_2: freshmen, time: DateTime.new(2018,9,16,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: cavalry, team_2: vverkh, time: DateTime.new(2018,9,16,13,0,0,'+03:00'), venue: luzhniki, season: s23},

{team_1: red_star, team_2: galactics, time: DateTime.new(2018,9,23,12,0,0,'+03:00'), venue: luzhniki, season: s21},
{team_1: freshmen, team_2: unsanctionables, time: DateTime.new(2018,9,23,12,0,0,'+03:00'), venue: luzhniki, season: s21},
{team_1: vverkh, team_2: happy_sundays, time: DateTime.new(2018,9,23,13,0,0,'+03:00'), venue: luzhniki, season: s21},
{team_1: coalition, team_2: cavalry, time: DateTime.new(2018,9,23,13,0,0,'+03:00'), venue: luzhniki, season: s21},

{team_1: galactics, team_2: freshmen, time: DateTime.new(2018,9,30,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: unsanctionables, team_2: vverkh, time: DateTime.new(2018,9,30,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: happy_sundays, team_2: cavalry, time: DateTime.new(2018,9,30,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: red_star, team_2: coalition, time: DateTime.new(2018,9,30,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: vverkh, team_2: galactics, time: DateTime.new(2018,9,30,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: cavalry, team_2: unsanctionables, time: DateTime.new(2018,9,30,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: coalition, team_2: happy_sundays, time: DateTime.new(2018,9,30,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: freshmen, team_2: red_star, time: DateTime.new(2018,9,30,13,0,0,'+03:00'), venue: luzhniki, season: s23},

{team_1: galactics, team_2: cavalry, time: DateTime.new(2018,10,7,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: unsanctionables, team_2: happy_sundays, time: DateTime.new(2018,10,7,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: red_star, team_2: vverkh, time: DateTime.new(2018,10,7,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: freshmen, team_2: coalition, time: DateTime.new(2018,10,7,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: happy_sundays, team_2: galactics, time: DateTime.new(2018,10,14,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: coalition, team_2: unsanctionables, time: DateTime.new(2018,10,14,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: cavalry, team_2: red_star, time: DateTime.new(2018,10,14,12,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: vverkh, team_2: freshmen, time: DateTime.new(2018,10,14,12,0,0,'+03:00'), venue: luzhniki, season: s23},

{team_1: galactics, team_2: unsanctionables, time: DateTime.new(2018,10,14,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: red_star, team_2: happy_sundays, time: DateTime.new(2018,10,14,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: freshmen, team_2: cavalry, time: DateTime.new(2018,10,14,13,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: vverkh, team_2: coalition, time: DateTime.new(2018,10,14,13,0,0,'+03:00'), venue: luzhniki, season: s23},

{team_1: a_team, team_2: d_team, time: DateTime.new(2018,10,21,11,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: b_team, team_2: c_team, time: DateTime.new(2018,10,21,11,0,0,'+03:00'), venue: luzhniki, season: s23},
{team_1: winner_1, team_2: winner_2, time: DateTime.new(2018,10,21,12,0,0,'+03:00'), venue: luzhniki, season: s23}]



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

  active_teams = Team.create([{ name: 'Coalition'}, { name: 'Vverkh'}, { name: 'Desperado'}, { name: 'Klerki'}, { name: 'Red Star'}, { name: 'Freshmen'}, { name: 'The Unsanctionables'}, { name: 'Cavalry'}, { name: 'The Galactics'}, { name: 'Happy Sundays'}])
  inactive_teams = Team.create([{ name: 'ING'}, { name: 'GreenTeam'}, { name: 'Basis'}, { name: 'Klerki'}, { name: 'British Embassy'}, { name: 'Bro-13'}, { name: 'Anthill'}, { name: 'Moystroitel'}, { name: 'B.O.R.T.'}, { name: 'The Six Offenders'}, { name: 'Black Rocket'}, { name: 'CREF'}, { name: 'Great Warriors'}, { name: 'FC Unifin'}, { name: 'Happy Sundays'}])
  finalists = Team.create([{name: 'Winner SF1'}, {name: 'Winner SF2'}, {name: 'Loser SF1'}, {name: 'Loser SF2'}, {name: '1st Placed'}, {name: '2nd Placed'}, {name: '3rd Placed'}, {name: '4th Placed'}])


  coalition = Team.find_by(name: "Coalition")
  vverkh = Team.find_by(name: "Vverkh")
  desperado = Team.find_by(name: "Desperado")
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

  spartak = Venue.create(name: "Spartak")

  s21 = Season.create(number: 21)
  s22 = Season.create(number: 22)

scheduled_matches =
[ {team_1: coalition, team_2: galactics, time: DateTime.new(2018,5,20,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: red_star, team_2: unsanctionables, time: DateTime.new(2018,5,20,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: freshmen, team_2: vverkh, time: DateTime.new(2018,5,20,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: desperado, team_2: cavalry, time: DateTime.new(2018,5,20,12,0,0,'+03:00'), venue: spartak, season: s22},

{team_1: coalition, team_2: vverkh, time: DateTime.new(2018,5,27,10,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: red_star, team_2: cavalry, time: DateTime.new(2018,5,27,10,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: freshmen, team_2: unsanctionables, time: DateTime.new(2018,5,27,11,0,0,'+03:00'), venue: spartak, season: s21, non_league: true},
{team_1: desperado, team_2: galactics, time: DateTime.new(2018,5,27,11,0,0,'+03:00'), venue: spartak, season: s21, non_league: true},
{team_1: winner_1, team_2: winner_2, time: DateTime.new(2018,5,27,12,0,0,'+03:00'), venue: spartak, season: s21, non_league: true},
{team_1: loser_1, team_2: loser_2, time: DateTime.new(2018,5,27,12,0,0,'+03:00'), venue: spartak, season: s21, non_league: true},

{team_1: coalition, team_2: desperado, time: DateTime.new(2018,6,3,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: red_star, team_2: freshmen, time: DateTime.new(2018,6,3,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: unsanctionables, team_2: cavalry, time: DateTime.new(2018,6,3,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: vverkh, team_2: galactics, time: DateTime.new(2018,6,3,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: cavalry, team_2: coalition, time: DateTime.new(2018,6,3,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: desperado, team_2: red_star, time: DateTime.new(2018,6,3,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: galactics, team_2: freshmen, time: DateTime.new(2018,6,3,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: vverkh, team_2: unsanctionables, time: DateTime.new(2018,6,3,12,0,0,'+03:00'), venue: spartak, season: s22},

{team_1: unsanctionables, team_2: coalition, time: DateTime.new(2018,6,17,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: vverkh, team_2: red_star, time: DateTime.new(2018,6,17,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: cavalry, team_2: freshmen, time: DateTime.new(2018,6,17,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: galactics, team_2: desperado, time: DateTime.new(2018,6,17,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: freshmen, team_2: coalition, time: DateTime.new(2018,6,17,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: galactics, team_2: red_star, time: DateTime.new(2018,6,17,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: desperado, team_2: unsanctionables, time: DateTime.new(2018,6,17,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: cavalry, team_2: vverkh, time: DateTime.new(2018,6,17,12,0,0,'+03:00'), venue: spartak, season: s22},

{team_1: coalition, team_2: red_star, time: DateTime.new(2018,6,24,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: unsanctionables, team_2: freshmen, time: DateTime.new(2018,6,24,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: vverkh, team_2: desperado, time: DateTime.new(2018,6,24,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: cavalry, team_2: galactics, time: DateTime.new(2018,6,24,11,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: freshmen, team_2: desperado, time: DateTime.new(2018,6,24,12,0,0,'+03:00'), venue: spartak, season: s22},
{team_1: unsanctionables, team_2: galactics, time: DateTime.new(2018,6,24,12,0,0,'+03:00'), venue: spartak, season: s22},

{team_1: a_team, team_2: d_team, time: DateTime.new(2018,7,1,11,0,0,'+03:00'), venue: spartak, season: s22, non_league: true},
{team_1: b_team, team_2: c_team, time: DateTime.new(2018,7,1,11,0,0,'+03:00'), venue: spartak, season: s22, non_league: true},
{team_1: winner_1, team_2: winner_2, time: DateTime.new(2018,7,1,12,0,0,'+03:00'), venue: spartak, season: s22, non_league: true}
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

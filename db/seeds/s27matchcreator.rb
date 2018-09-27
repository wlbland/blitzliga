

  
  freshmen = Team.find_by(name: "Freshmen")
  unsanctionables = Team.find_by(name: "The Unsanctionables")
  luzhniki = Venue.find_by(name: "Luzhniki", pitch: "6")

  s23 = Season.find_by(number: 23)

scheduled_matches =
[{team_1: freshmen, team_2: unsanctionables, time: DateTime.new(2018,10,7,12,0,0,'+03:00'), venue: luzhniki, season: s23}]



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

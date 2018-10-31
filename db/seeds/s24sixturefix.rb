cavalry = Team.find(8)
vverkh = Team.find(2)


cavalry_team_fixtures = [267, 262, 255, 248, 241]
vverkh_team_fixtures = [63, 260, 249, 244, 242]


cavalry_team_fixtures.each do |team_fixture_id|
	TeamFixture.find(team_fixture_id).update(team: vverkh)
end

vverkh_team_fixtures.each do |team_fixture_id|
	TeamFixture.find(team_fixture_id).update(team: cavalry)
end


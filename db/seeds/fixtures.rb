
# teams assigned names
  coalition = Team.find_by(name: "Coalition")
  vverkh = Team.find_by(name: "Vverkh")
  desperado = Team.find_by(name: "Desperado")
  red_star = Team.find_by(name: "Red Star")
  freshmen = Team.find_by(name: "Freshmen")
  unsanctionables = Team.find_by(name: "Unsanctionables")
  cavalry = Team.find_by(name: "Cavalry")
  galactics = Team.find_by(name: "The Galactics")

# fixtures assigned dates
game_1 =  Fixture.create(time: DateTime.new(2018,5,20,11,0,0,'+03:00'))
game_2 =  Fixture.create(time: DateTime.new(2018,5,20,11,0,0,'+03:00'))
game_3 =  Fixture.create(time: DateTime.new(2018,5,20,12,0,0,'+03:00'))
game_4 =  Fixture.create(time: DateTime.new(2018,5,20,12,0,0,'+03:00'))

game_5 =  Fixture.create(time: DateTime.new(2018,5,27,11,0,0,'+03:00'))
game_6 =  Fixture.create(time: DateTime.new(2018,5,27,11,0,0,'+03:00'))
game_7 =  Fixture.create(time: DateTime.new(2018,5,27,12,0,0,'+03:00'))
game_8 =  Fixture.create(time: DateTime.new(2018,5,27,12,0,0,'+03:00'))



# team fixtures assigned teams and fixtures
# day 1
TeamFixture.create(team: coalition, fixture: game_1)
TeamFixture.create(team: galactics, fixture: game_1)

TeamFixture.create(team: red_star, fixture: game_2)
TeamFixture.create(team: unsanctionables, fixture: game_2)

TeamFixture.create(team: freshmen, fixture: game_3)
TeamFixture.create(team: vverkh, fixture: game_3)

TeamFixture.create(team: desperado, fixture: game_4)
TeamFixture.create(team: cavalry, fixture: game_4)

#day 2
TeamFixture.create(team: coalition, fixture: game_5)
TeamFixture.create(team: unsanctionables, fixture: game_5)

TeamFixture.create(team: red_star, fixture: game_6)
TeamFixture.create(team: galactics, fixture: game_6)

TeamFixture.create(team: freshmen, fixture: game_7)
TeamFixture.create(team: cavalry, fixture: game_7)

TeamFixture.create(team: desperado, fixture: game_8)
TeamFixture.create(team: vverkh, fixture: game_8)


  spartak3 = Venue.create(name: "Spartak", pitch: "3")

  f1 = Fixture.find(5)
  f2 = Fixture.find(6)
  f3 = Fixture.find(7)
  f4 = Fixture.find(8)
  f5 = Fixture.find(9)
  f6 = Fixture.find(10)

  f1.update!(venue: spartak3)
  f2.update!(venue: spartak3)
  f3.update!(venue: spartak3)

  f4.update!(venue: spartak3)
  f5.update!(venue: spartak3)
  f6.update!(venue: spartak3)

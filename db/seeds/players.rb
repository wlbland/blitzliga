  coalition = Team.find_by(name: "Coalition")
  vverkh = Team.find_by(name: "Vverkh")
  desperado = Team.find_by(name: "Desperado")
  red_star = Team.find_by(name: "Red Star")
  freshmen = Team.find_by(name: "Freshmen")
  unsanctionables = Team.find_by(name: "The Unsanctionables")
  cavalry = Team.find_by(name: "Cavalry")
  galactics = Team.find_by(name: "The Galactics")

desperado_players = Player.create([{first_name: "Христофор", last_name: "Авакян", team: desperado},
{first_name: "Оганес", last_name: "Испирян", team: desperado},
{first_name: "Тигран", last_name: "Мамиконян", team: desperado},
{first_name: "Армен", last_name: "Торосян", team: desperado},
{first_name: "Ваган", last_name: "Татевосян", team: desperado},
{first_name: "Лерник", last_name: "Мирзаханян", team: desperado},
{first_name: "Владимир", last_name: "Мотин", team: desperado},
{first_name: "Арег", last_name: "Абрамян", team: desperado},
{first_name: "Размик", last_name: "Симонян", team: desperado},
{first_name: "Андраник", last_name: "Налбандян", team: desperado},
{first_name: "Андрей", last_name: "Логунов", team: desperado},
{first_name: "Ваня", last_name: "Махно", team: desperado}])
desperado_players.each do |player|
  player.update(registered: true)
end



freshmen_players = Player.create([{first_name: "Alfred", last_name: "Mabudoko", team: freshmen},
{first_name: "Arnaud", last_name: "Darde", team: freshmen},
{first_name: "Allan", last_name: "Ollivier", team: freshmen},
{first_name: "Appolonia", last_name: "Houegbeadan", team: freshmen},
{first_name: "Guillaume", last_name: "Aba", team: freshmen},
{first_name: "Jean-Louis", last_name: "Tauvy", team: freshmen},
{first_name: "Lukas", last_name: "Menabde", team: freshmen},
{first_name: "Marco", last_name: "Suz", team: freshmen},
{first_name: "Matteo", last_name: "Caldart", team: freshmen},
{first_name: "Romain", last_name: "Boniface", team: freshmen},
{first_name: "Tahir", last_name: "Moussa", team: freshmen},
{first_name: "Tony", last_name: "Orriere", team: freshmen}])
freshmen_players.each do |player|
  player.update(registered: true)
end

team = galactics
galactics_players = Player.create([{first_name: "Rainer", last_name: "Fischer", team: team},
{first_name: "Grigory", last_name: "Kleyner", team: team},
{first_name: "Colm", last_name: "Rowan", team: team},
{first_name: "Vincent", last_name: "Weightman", team: team},
{first_name: "Alexandr", last_name: "Maltsev", team: team},
{first_name: "Vadim", last_name: "Demin", team: team},
{first_name: "Oleg", last_name: "Popov", team: team},
{first_name: "Brian", last_name: "Malone", team: team},
{first_name: "Andrew", last_name: "Wiese", team: team},
{first_name: "Misha", last_name: "Guskin", team: team},
{first_name: "Nathaniel", last_name: "Bateson", team: team},
{first_name: "Jerson", last_name: "----", team: team}])
galactics_players.each do |player|
  player.update(registered: true)
end

team = red_star
red_star_players = Player.create([{first_name: "Paul Rafton", team: team},
{first_name: "Jamie", last_name: "Chapman", team: team},
{first_name: "Chris", last_name: "Chapman", team: team},
{first_name: "Sam", last_name: "Davis", team: team},
{first_name: "Chris", last_name: "Charlton", team: team},
{first_name: "Alex", last_name: "Casey", team: team},
{first_name: "Martijn", last_name: "Kraij", team: team},
{first_name: "Matthew", last_name: "Payne", team: team},
{first_name: "Pete", last_name: "Carr", team: team},
{first_name: "Curtis", last_name: "Baxter", team: team},
{first_name: "Chris", last_name: "Parker", team: team},
{first_name: "Simon", last_name: "Rowat", team: team}])
red_star_players.each do |player|
  player.update(registered: true)
end

team = vverkh
vverkh_players = Player.create([{last_name: "Куприянов", first_name: "Николай", team: team},
{last_name: "Малышев", first_name: "Андрей", team: team},
{last_name: "Худойдодов", first_name: "Денис", team: team},
{last_name: "Черненко", first_name: "Сергей", team: team},
{last_name: "Богданов", first_name: "Владислав", team: team},
{last_name: "Кузнецов", first_name: "Василий", team: team},
{last_name: "Мгеладзе", first_name: "Георгий", team: team},
{last_name: "Балаев", first_name: "Эдуард", team: team},
{last_name: "Обоев", first_name: "Елисей", team: team},
{last_name: "Шишков", first_name: "Александр", team: team},
{last_name: "Беляев", first_name: "Григорий", team: team},
{last_name: "Кашаев", first_name: "Кирилл", team: team},
{last_name: "Сандаров", first_name: "Алексей", team: team}])
vverkh_players.each do |player|
  player.update(registered: true)
end

team = coalition
coalition_players = Player.create([{first_name: "Tom", last_name: "Balmforth", team: team},
{first_name: "Will", last_name: "Chilcott", team: team},
{first_name: "Felip", last_name: "Cesar", team: team},
{first_name: "Erhan", last_name: "Poyrazoglu", team: team},
{first_name: "Ravi", last_name: "Kotecha", team: team},
{first_name: "Andy", last_name: "Risk", team: team},
{first_name: "Borj", last_name: "Carsi", team: team},
{first_name: "Ivan", last_name: "Martynenko", team: team},
{first_name: "Gergely", last_name: "Stewart", team: team},
{first_name: "Aleksandr", last_name: "Sobolev", team: team}])
coalition_players.each do |player|
  player.update(registered: true)
end

team = unsanctionables
unsanctionables_players = Player.create([{first_name: "Jack", last_name: "Chapman", team: team},
{first_name: "Amaan", last_name: "Fazal", team: team},
{first_name: "JJ", last_name: "O’Shea", team: team},
{first_name: "Martin", last_name: "Andrew", team: team},
{first_name: "Hossein", last_name: "Hossein", team: team},
{first_name: "Paul", last_name: "Friar", team: team},
{first_name: "Christian", last_name: "Hernandez", team: team},
{first_name: "Dave", last_name: "Knape", team: team},
{first_name: "Uri", last_name: "Espana", team: team},
{first_name: "Chris", last_name: "Donkin", team: team}])
unsanctionables_players.each do |player|
  player.update(registered: true)
end

team = cavalry
cavalry_players = Player.create([{first_name: "Chris", last_name: "Fawcett", team: team},
{first_name:"Andrei", last_name: "Znobischev", team: team},
{first_name:"Marat", last_name: "Baichurin", team: team},
{first_name:"Ross", last_name: "Kernow", team: team},
{first_name:"Kirill", last_name: "Sabetsky", team: team},
{first_name:"Kostya", last_name: "Kazantsev", team: team},
{first_name:"David", last_name: "Paulley", team: team},
{first_name:"Malcolm", last_name: "Garlick", team: team},
{first_name:"Erwin", last_name: "Grebe", team: team},
{first_name:"Kamil", last_name: "Rabdanov", team: team}])
cavalry_players.each do |player|
  player.update(registered: true)
end
